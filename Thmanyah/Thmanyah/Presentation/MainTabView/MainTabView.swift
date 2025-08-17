//
//  MainTabView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView(viewModel: HomeViewModel(
                fetchHomeSectionsUseCase: FetchHomeSectionsUseCase(
                    homeRepo: HomeRepository(
                        remoteDataSource: HomeRemoteDataSource(networkManager: NetworkManager.shared))))
            )
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            SearchView(viewModel: SearchViewModel(fetchSearchSectionsUseCase: FetchSearchSectionsUseCase(searchRepo: SearchRepository(remoteDataSource: SearchRemoteDataSource(networkManager: NetworkManager.shared))))
            )
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
    }
}

#Preview {
    MainTabView()
}

