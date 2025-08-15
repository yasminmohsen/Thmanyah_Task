//
//  HomeRemoteDataSource.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

protocol IHomeRemoteDataSource {
    func fetchHomeSections(page: Int?) async throws -> HomeSectionsDTO
}

final class HomeRemoteDataSource: IHomeRemoteDataSource {
    let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchHomeSections(page: Int?) async throws -> HomeSectionsDTO {
        let url = Endpoints.homeSections(page: page ?? 1)
        
        return try await networkManager.request(HomeSectionsDTO.self, errorType: APIError.self, from: url, method: .get, body: nil, headers: [:])
    }
}
