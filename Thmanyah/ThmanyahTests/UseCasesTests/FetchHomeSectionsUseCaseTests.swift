//
//  FetchHomeSectionsUseCaseTests.swift
//  ThmanyahTests
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import XCTest
@testable import Thmanyah

final class FetchHomeSectionsUseCaseTests: XCTestCase {
    private var mockHomeRepository: MockHomeRepository!
    private var fetchHomeSectionsUseCase: FetchHomeSectionsUseCase!
    
    override func setUp() {
        mockHomeRepository = MockHomeRepository()
        fetchHomeSectionsUseCase = FetchHomeSectionsUseCase(homeRepo: mockHomeRepository)
    }
    
    override func tearDown() {
        fetchHomeSectionsUseCase = nil
        mockHomeRepository = nil
    }
    
    func test_loadInitial_success() async {
        mockHomeRepository.result = .success(HomeSections(sections: [SectionItem.mock()], pagination: Pagination(nextPage: "2", totalPages: 3)))
        
        let result = await fetchHomeSectionsUseCase.loadInitial()
        
        switch result {
        case .success(let homeSection):
            XCTAssertEqual(homeSection.sections.count, 1)
        case .failure(_):
            XCTFail()
        }
    }
    
    func test_loadInitial_failure() async {
        mockHomeRepository.result = .failure(APIError(message: "Netwrok Error", code: 500))
        
        let result = await fetchHomeSectionsUseCase.loadInitial()
        
        switch result {
        case .success(_):
            XCTFail()
        case .failure(let error):
            XCTAssertEqual(error.message, "Netwrok Error")
        }
    }

    func test_loadMore_success() async {
        mockHomeRepository.result = .success(HomeSections(sections: [SectionItem.mock()], pagination: Pagination(nextPage: "2", totalPages: 3)))
        
        _ = await fetchHomeSectionsUseCase.loadInitial()
        let result = await fetchHomeSectionsUseCase.loadMore()
        
        switch result {
        case .success(let homeSection):
            XCTAssertEqual(homeSection.sections.count, 2)
        case .failure(_):
            XCTFail()
        }
    }
    
    func test_loadMore_failure() async {
        mockHomeRepository.result = .success(HomeSections(sections: [SectionItem.mock()], pagination: Pagination(nextPage: "1", totalPages: 1)))
        
        _ = await fetchHomeSectionsUseCase.loadInitial()
        let result = await fetchHomeSectionsUseCase.loadMore()
        
        switch result {
        case .success(let _):
            XCTFail()
        case .failure(let error):
            XCTAssertEqual(error.message, "No more pages")
        }
    }

}
