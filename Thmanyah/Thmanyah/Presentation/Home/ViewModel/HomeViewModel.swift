//
//  HomeViewModel.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var sections: [SectionItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let fetchHomeSectionsUseCase: IFetchHomeSectionsUseCase
    private var currentPage = 1
    private var totalPages = 10
    
    init(fetchHomeSectionsUseCase: IFetchHomeSectionsUseCase) {
        self.fetchHomeSectionsUseCase = fetchHomeSectionsUseCase
    }
    
    func loadInitialSections() async {
        currentPage = 1
        await loadSections(page: currentPage)
    }
    
    func loadMoreSections() async {
        guard currentPage < totalPages else { return }
        currentPage += 1
        await loadSections(page: currentPage)
    }
    
    private func loadSections(page: Int) async {
        isLoading = true
        let result = await fetchHomeSectionsUseCase.execute(currentSections: sections, page: page)
        switch result {
        case .success(let homeSection):
            totalPages = homeSection.pagination.totalPages
            sections = homeSection.sections
            isLoading = false
        case .failure(let error):
            errorMessage = error is APIError ? error.message : error.localizedDescription
            isLoading = false
        }
    }
}
