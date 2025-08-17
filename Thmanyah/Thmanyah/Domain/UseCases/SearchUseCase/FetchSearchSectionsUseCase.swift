//
//  FetchSearchSectionsUseCase.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

protocol IFetchSearchSectionsUseCase {
    func execute(query: String) async -> Result<SearchSections, APIError>
}

final class FetchSearchSectionsUseCase: IFetchSearchSectionsUseCase {
    private let searchRepo: ISearchRepository
    
    init(searchRepo: ISearchRepository) {
        self.searchRepo = searchRepo
    }
    
    func execute(query: String) async -> Result<SearchSections, APIError> {
        do {
            let searchSections = try await searchRepo.getHomeSections(query: query)
            return .success(searchSections)
        } catch(let error) {
            return .failure(error as? APIError ?? APIError(message: error.localizedDescription, code: 500))
        }
    }
}
