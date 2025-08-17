//
//  HomeViewModelTests.swift
//  ThmanyahTests
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import XCTest
@testable import Thmanyah

@MainActor
final class HomeViewModelTests: XCTestCase {
    
    private var mockFetchHomeSectionsUseCase: MockFetchHomeSectionsUseCase!
    private var homeViewModel: HomeViewModel!
    
    override func setUp() {
        mockFetchHomeSectionsUseCase = MockFetchHomeSectionsUseCase()
        homeViewModel = HomeViewModel(fetchHomeSectionsUseCase: mockFetchHomeSectionsUseCase)
    }
    
    override func tearDown() {
        homeViewModel = nil
        mockFetchHomeSectionsUseCase = nil
    }
    
    func test_loadInitialSections_success() async {
        mockFetchHomeSectionsUseCase.result = .success(HomeSections(sections: [SectionItem.mock()], pagination: Pagination(nextPage: "2", totalPages: 10)))
        
        await homeViewModel.loadInitialSections()
        
        XCTAssertEqual(homeViewModel.sections.count, 1)
    }
    
    func test_loadInitialSections_failure() async {
        mockFetchHomeSectionsUseCase.result = .failure(APIError(message: "Network error", code: 500))
        
        await homeViewModel.loadInitialSections()
        
        XCTAssertNotEqual(homeViewModel.sections.count, 1)
        XCTAssertEqual(homeViewModel.errorMessage, "Network error")
    }
    
    func test_loadMoreSections_failure() async {
        mockFetchHomeSectionsUseCase.hasMorePages = false
        
        await homeViewModel.loadMoreSections()
        
        XCTAssertTrue(homeViewModel.sections.isEmpty)
    }
}



extension SectionItem {
    static func mock() -> SectionItem {
        SectionItem(
            name: "Mock Section",
            type: .square,
            contentType: .podcast,
            order: 1,
            content: .podcasts([])
        )
    }
}
