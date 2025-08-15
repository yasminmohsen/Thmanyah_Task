//
//  NetworkManager.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//
import Foundation

protocol INetworkManager {
    func request<T: Decodable, E: Decodable>(
        _ type: T.Type,
        errorType: E.Type,
        from url: URL,
        method: HTTPRequestMethod,
        body: Data?,
        headers: [String: String]
    ) async throws -> T
}

final class NetworkManager: INetworkManager {
    
    static let shared: NetworkManager = NetworkManager()
    
    private init() {}
    
    func request<T: Decodable, E: Decodable>(
        _ type: T.Type,
        errorType: E.Type,
        from url: URL,
        method: HTTPRequestMethod = .get,
        body: Data? = nil,
        headers: [String: String] = [:]
    ) async throws -> T {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return try JSONDecoder().decode(T.self, from: data)
            
        default:
            if let errorModel = try? JSONDecoder().decode(E.self, from: data) {
                throw NetworkError.apiError(errorModel)
            } else {
                throw NetworkError.unexpectedStatusCode(httpResponse.statusCode)
            }
        }
    }
}
