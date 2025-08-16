//
//  HomeView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel(
        fetchHomeSectionsUseCase: FetchHomeSectionsUseCase(
            homeRepo: HomeRepository(
                remoteDataSource: HomeRemoteDataSource(networkManager: NetworkManager.shared)
            )
        )
    )
    
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
            
            if !viewModel.isLoading {
                ScrollView(showsIndicators: false) {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(viewModel.sections, id: \.id) { section in
                            VStack(alignment: .leading, spacing: 0) {
                                Text(section.name)
                                    .font(.headline)
                                    .frame(alignment: .leading)
                                    .padding(.top, 20)
                                    .padding(.bottom, 12)
                                
                                switch section.content {
                                case .podcasts(let podcasts):
                                    
                                    setUpSections(sectionType: section.type, items: podcasts)
                                    
                                case .episodes(let episodes):
                                    
                                    setUpSections(sectionType: section.type, items: episodes)
                                    
                                case .audioBooks(let books):
                                    
                                    setUpSections(sectionType: section.type, items: books)
                                    
                                case .audioArticles(let articles):
                                    setUpSections(sectionType: section.type, items: articles)
                                case .none:
                                    Text("No content")
                                        .foregroundColor(.secondary)
                                }
                            }.task {
                                if section.id == viewModel.sections.last?.id {
                                    await viewModel.loadMoreSections()
                                }
                            }
                        }
                    }
                }.padding(.all, 16)

            } else {
               LoadingStateHomeView()
            }
        }.task {
            await viewModel.loadInitialSections()
        }
    }
    
    @ViewBuilder
    func cardView(item: UIContentItem,for layout: SectionLayoutType) -> some View {
        switch layout {
        case .square:
            SquareCardView(contentItem: item)
        case .bigSquare:
            BigSquareCardView(contentItem: item)
        case .queue:
            QueueCardView(contentItem: item)
        case .twoLinesGrid:
            TwoLinesGridCardView(contentItem: item)
        case .unknown:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func setUpSections(sectionType: SectionLayoutType, items: [any Identifiable]) ->   some View {
        
        let uiContentItems = items.map{UIContentItemMapper.map($0)}
        Group {
            if sectionType == .bigSquare {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 12) {
                        ForEach(uiContentItems.indices, id: \.self) { index in
                            cardView(item: uiContentItems[index], for: .bigSquare)
                        }
                    }
                }
            } else if sectionType == .twoLinesGrid {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(uiContentItems.indices, id: \.self) { index in
                            cardView(item:uiContentItems[index] ,for: sectionType)
                        }
                    }
                }
            }
            else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(uiContentItems) {item in
                            cardView(item:item ,for: sectionType)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
