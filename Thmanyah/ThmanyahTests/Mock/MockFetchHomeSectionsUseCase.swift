//
//  MockFetchHomeSectionsUseCase.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//
import XCTest
@testable import Thmanyah

final class MockFetchHomeSectionsUseCase: IFetchHomeSectionsUseCase {
    var result: Result<HomeSections, APIError> = .success(HomeSections(sections: [], pagination: Pagination(nextPage: "2", totalPages: 3)))
    
    var hasMorePages: Bool = true
    
    func loadInitial() async -> Result<HomeSections, APIError> {
        return result
    }
    
    func loadMore() async -> Result<HomeSections, APIError> {
        return result
    }
}
