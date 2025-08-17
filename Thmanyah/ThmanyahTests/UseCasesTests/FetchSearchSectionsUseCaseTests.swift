//
//  FetchSearchSectionsUseCaseTests.swift
//  ThmanyahTests
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import XCTest
@testable import Thmanyah

final class FetchSearchSectionsUseCaseTests: XCTestCase {
    private var mockSearchRepository: MockSearchRepository!
    private var fetchSearchSectionsUseCase: FetchSearchSectionsUseCase!
    
    override func setUp() {
        mockSearchRepository = MockSearchRepository()
        fetchSearchSectionsUseCase = FetchSearchSectionsUseCase(searchRepo: mockSearchRepository)
    }
    
    override func tearDown() {
        fetchSearchSectionsUseCase = nil
        mockSearchRepository = nil
    }
    
    func test_execute_success() async {
        mockSearchRepository.result = .success(SearchSections(sections: [SectionItem.mock()]))
        
        let result = await fetchSearchSectionsUseCase.execute(query: "podcast")
        
        switch result {
        case .success(let searchSection):
            XCTAssertEqual(searchSection.sections.count, 1)
        case .failure(_):
            XCTFail()
        }
        
    }
    
    func test_execute_failure() async {
        mockSearchRepository.result = .failure(APIError(message: "Network Error", code: 500))
        
        let result = await fetchSearchSectionsUseCase.execute(query: "podcast")
        
        switch result {
        case .success(_):
            XCTFail()
        case .failure(let error):
            XCTAssertEqual(error.message, "Network Error")
        }
        
    }
}
