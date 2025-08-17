//
//  HomeView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI

struct HomeView: View {
    //MARK: - ObservedObjects
    @ObservedObject private(set) var viewModel: HomeViewModel
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Custom header
            HStack(alignment: .center) {
                Text("Home")
                    .font(.largeTitle.bold())
                    .padding(.bottom, 16)
                Spacer()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom, 16)
                
            } .padding(.horizontal, 16)
                .padding(.top, 30)
                .background(Color(R.color.lightOrange).opacity(0.3))
            //Sections Content
            if !viewModel.isLoading {
                CardsContainerView(sections: viewModel.sections) {
                    await viewModel.loadMoreSections()
                }
            } else {
                LoadingStateHomeView()
            }
        }.task {
            await viewModel.loadInitialSections()
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(
        fetchHomeSectionsUseCase: FetchHomeSectionsUseCase(
            homeRepo: HomeRepository(
                remoteDataSource: HomeRemoteDataSource(networkManager: NetworkManager.shared)))))
}
