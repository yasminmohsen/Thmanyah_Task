//
//  SearchViewModelTests.swift
//  ThmanyahTests
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import XCTest
@testable import Thmanyah

@MainActor
final class SearchViewModelTests: XCTestCase {
    private var mockFetchSearchSectionsUseCase: MockFetchSearchSectionsUseCase!
    private var searchViewModel: SearchViewModel!
    
    override func setUp() {
       mockFetchSearchSectionsUseCase = MockFetchSearchSectionsUseCase()
       searchViewModel = SearchViewModel(fetchSearchSectionsUseCase: mockFetchSearchSectionsUseCase)
    }

    override func tearDown() {
        searchViewModel = nil
        mockFetchSearchSectionsUseCase = nil
    }
    func test_search_success() async {
        mockFetchSearchSectionsUseCase.result = .success(SearchSections(sections: [SectionItem.mock()]))
        
        searchViewModel.query = "podcast"
        
        try? await Task.sleep(nanoseconds: 300_000_000)
        
        XCTAssertEqual(searchViewModel.sections.count, 1)
    }
    
    func test_search_failure() async {
        mockFetchSearchSectionsUseCase.result = .failure(APIError(message: "Network Error", code: 500))
        
        searchViewModel.query = "podcast"
        
        try? await Task.sleep(nanoseconds: 300_000_000)
        
        XCTAssertNotEqual(searchViewModel.sections.count, 1)
        XCTAssertEqual(searchViewModel.errorMessage, "Network Error")
    }
}
