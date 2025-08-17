//
//  SearchRepository.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import Foundation

protocol ISearchRepository {
    func getHomeSections(query: String) async throws -> SearchSections
}

final class SearchRepository: ISearchRepository {
    private let remoteDataSource: ISearchRemoteDataSource
    
    init(remoteDataSource: ISearchRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getHomeSections(query: String) async throws -> SearchSections {
        let searchSectionsDTO = try await remoteDataSource.fetchSearchSections(query: query)
       return searchSectionsDTO.toDomain()
    }
}
