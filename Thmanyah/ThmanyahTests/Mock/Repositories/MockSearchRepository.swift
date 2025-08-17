//
//  MockSearchRepository.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import XCTest
@testable import Thmanyah

final class MockSearchRepository: ISearchRepository {
    var result: Result<SearchSections, APIError> = .success(SearchSections(sections: []))
    
    
    func getHomeSections(query: String) async throws -> SearchSections {
        switch result {
        case .success(let sections):
            return sections
        case .failure(let error):
            throw(error)
        }
    }
}
