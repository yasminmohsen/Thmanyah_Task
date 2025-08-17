//
//  SearchView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import SwiftUI
import Combine

struct SearchView: View {
    //MARK: - ObservedObjects
    @ObservedObject private(set) var viewModel: SearchViewModel
    
    //MARK: - Body
    var body: some View {
        VStack {
            //Search Text Field
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $viewModel.query)
                    .textFieldStyle(PlainTextFieldStyle())
                    .disableAutocorrection(true)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .padding(.horizontal)
            //Section Content
            if viewModel.isLoading {
                ProgressView("Searching...")
                    .padding(.top, 40)
                Spacer()
            } else {
                CardsContainerView(sections: viewModel.sections) {}
            }
        }
    }
}


#Preview {
    SearchView(viewModel: SearchViewModel(fetchSearchSectionsUseCase: FetchSearchSectionsUseCase(searchRepo: SearchRepository(remoteDataSource: SearchRemoteDataSource(networkManager: NetworkManager.shared)))))
}
