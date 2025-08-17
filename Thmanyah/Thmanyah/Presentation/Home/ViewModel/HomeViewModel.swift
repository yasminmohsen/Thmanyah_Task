//
//  HomeViewModel.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    //MARK: - Publishers
    @Published var sections: [SectionItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    //MARK: - Properties
    private let fetchHomeSectionsUseCase: IFetchHomeSectionsUseCase
    
    //MARK: - Initilaizer
    init(fetchHomeSectionsUseCase: IFetchHomeSectionsUseCase) {
        self.fetchHomeSectionsUseCase = fetchHomeSectionsUseCase
    }
    
    //MARK: - Functions
    func loadInitialSections() async {
        isLoading = true
        let result = await fetchHomeSectionsUseCase.loadInitial()
        handleResult(result)
    }
    
    func loadMoreSections() async {
        guard fetchHomeSectionsUseCase.hasMorePages else { return }
        let result = await fetchHomeSectionsUseCase.loadMore()
        handleResult(result)
    }
    
    private func handleResult(_ result: Result<HomeSections, APIError>) {
        switch result {
        case .success(let homeSection):
            sections = homeSection.sections
        case .failure(let error):
            errorMessage = error.message
        }
        isLoading = false
    }
}
