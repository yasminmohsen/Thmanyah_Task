//
//  SearchRemoteDataSource.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

protocol ISearchRemoteDataSource {
    func fetchSearchSections(query:String) async throws -> SearchSectionDTO
}

final class SearchRemoteDataSource: ISearchRemoteDataSource {
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchSearchSections(query:String) async throws -> SearchSectionDTO {
        let url = Endpoints.search(with: query)
        
        return try await networkManager.request(SearchSectionDTO.self, errorType: APIError.self, from: url, method: .get, body: nil, headers: [:])
    }
}
