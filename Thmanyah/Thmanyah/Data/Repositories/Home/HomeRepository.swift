//
//  HomeRepository.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

import Foundation

protocol IHomeRepository {
    func getHomeSections(page: Int?) async throws -> [SectionItem]
}

final class HomeRepository: IHomeRepository {
    private let remoteDataSource: IHomeRemoteDataSource
    
    init(remoteDataSource: IHomeRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getHomeSections(page: Int?) async throws -> [SectionItem] {
        let sectionsDTO = try await remoteDataSource.fetchHomeSections(page: page)
        print(sectionsDTO)
        let arr = sectionsDTO.sections.map { $0.toDomain() }
        return arr
    }
}
