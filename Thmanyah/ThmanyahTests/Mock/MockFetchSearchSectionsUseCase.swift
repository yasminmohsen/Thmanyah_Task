//
//  MockFetchSearchSectionsUseCase.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//
import XCTest
@testable import Thmanyah

final class MockFetchSearchSectionsUseCase: IFetchSearchSectionsUseCase {
    var result: Result<SearchSections, APIError> = .success(SearchSections(sections: []))
    
    func execute(query: String) async -> Result<SearchSections, APIError> {
        return result
    }
}

