//
//  FetchHomeSectionsUseCase.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//
import Foundation

protocol IFetchHomeSectionsUseCase {
    func execute(currentSections: [SectionItem], page: Int) async -> Result<HomeSections, APIError>
}

final class FetchHomeSectionsUseCase: IFetchHomeSectionsUseCase {
    private let homeRepo: IHomeRepository
    
    init(homeRepo: IHomeRepository) {
        self.homeRepo = homeRepo
    }
    
    func  execute(currentSections: [SectionItem], page: Int) async -> Result<HomeSections, APIError> {
        do {
            let homeSections = try await homeRepo.getHomeSections(page: page)
            let updatedHomeSec  = HomeSections(sections:  page > 1 ? currentSections + homeSections.sections : homeSections.sections, pagination:homeSections.pagination)
            return .success(updatedHomeSec)
        } catch(let error) {
            return .failure(error as? APIError ?? APIError(message: "\(error.localizedDescription)", code: 404))
        }
    }
}
