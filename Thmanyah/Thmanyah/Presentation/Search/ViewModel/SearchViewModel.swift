//
//  SearchViewModel.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import Combine
import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    //MARK: - Publishers
    @Published var query: String = ""
    @Published var sections: [SectionItem] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    //MARK: - Properties
    private var subscriptions = Set<AnyCancellable>()
    private let fetchSearchSectionsUseCase: IFetchSearchSectionsUseCase
    
    //MARK: - Initilaizer
    init(fetchSearchSectionsUseCase: IFetchSearchSectionsUseCase) {
        self.fetchSearchSectionsUseCase = fetchSearchSectionsUseCase
        
        bindQuery()
    }
    
    //MARK: - Functions
    private func bindQuery() {
        $query
            .debounce(for: .milliseconds(200), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                guard let self else { return }
                print("Query is \(text)")
                Task {
                    await self.search(query: text)
                }
            }
            .store(in: &subscriptions)
    }
    
    func search(query: String) async {
        guard !query.isEmpty else {
            sections = []
            return
        }
        isLoading = true
        
        let result =  await fetchSearchSectionsUseCase.execute(query: query)
        switch result {
        case .success(let searchSecs):
            self.sections = searchSecs.sections
        case .failure(let error):
            errorMessage = error.message
        }
        
        isLoading = false
    }
}
