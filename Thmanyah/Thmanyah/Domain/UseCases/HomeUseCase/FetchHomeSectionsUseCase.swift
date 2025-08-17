//
//  FetchHomeSectionsUseCase.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//
import Foundation

protocol IFetchHomeSectionsUseCase {
    func loadInitial() async -> Result<HomeSections, APIError>
    func loadMore() async -> Result<HomeSections, APIError>
    var hasMorePages: Bool { get }
}

final class FetchHomeSectionsUseCase: IFetchHomeSectionsUseCase {
    private let homeRepo: IHomeRepository
    
    private var currentPage = 1
    private var totalPages = 1
    private var allSections: [SectionItem] = []
    
    init(homeRepo: IHomeRepository) {
        self.homeRepo = homeRepo
    }
    
    var hasMorePages: Bool {
        currentPage < totalPages
    }
    
    func loadInitial() async -> Result<HomeSections, APIError> {
        currentPage = 1
        allSections = []
        return await fetchPage(page: currentPage)
    }
    
    func loadMore() async -> Result<HomeSections, APIError> {
        guard hasMorePages else {
            return .failure(APIError(message: "No more pages", code: 999))
        }
        currentPage += 1
        return await fetchPage(page: currentPage)
    }
    
    private func fetchPage(page: Int) async -> Result<HomeSections, APIError> {
        do {
            let homeSections = try await homeRepo.getHomeSections(page: page)
            
            totalPages = homeSections.pagination.totalPages
            allSections.append(contentsOf: homeSections.sections)
            
            let updated = HomeSections(
                sections: allSections,
                pagination: homeSections.pagination)
            return .success(updated)
        } catch {
            return .failure(error as? APIError ?? APIError(message: error.localizedDescription, code: 500))
        }
    }
}

