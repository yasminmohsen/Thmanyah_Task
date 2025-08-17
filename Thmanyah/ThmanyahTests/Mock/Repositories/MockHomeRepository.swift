//
//  MockHomeRepository.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import XCTest
@testable import Thmanyah

final class MockHomeRepository: IHomeRepository {
    var result: Result<HomeSections, APIError> = .success(HomeSections(sections: [], pagination: Pagination(nextPage: "2", totalPages: 3)))
    
    func getHomeSections(page: Int?) async throws -> HomeSections {
        switch result {
        case .success(let success):
            return success
        case .failure(let error):
            throw error
        }
    }
}
