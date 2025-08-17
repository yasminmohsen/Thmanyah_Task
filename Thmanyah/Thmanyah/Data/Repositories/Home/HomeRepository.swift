//
//  HomeRepository.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

import Foundation

protocol IHomeRepository {
    func getHomeSections(page: Int?) async throws -> HomeSections
}

final class HomeRepository: IHomeRepository {
    private let remoteDataSource: IHomeRemoteDataSource
    
    init(remoteDataSource: IHomeRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getHomeSections(page: Int?) async throws -> HomeSections {
        let homeSectionsDTO = try await remoteDataSource.fetchHomeSections(page: page)
        
        return homeSectionsDTO.toDomain()
    }
}
