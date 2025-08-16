//
//  HomeView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

//
//  ContentView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
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
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 20) {
                ForEach(viewModel.sections, id: \.id) { section in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(section.name)
                            .font(.headline)
                            .padding(.horizontal)
                        
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
                    }
                }
            }
        }.padding(.all, 8)
            .task {
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
                 TabView {
                    ForEach(uiContentItems) { item in
                        cardView(item:item ,for: sectionType)
                    }
                }
                .frame(height: 200)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
            } else if sectionType == .twoLinesGrid {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(uiContentItems) { item in
                               cardView(item:item ,for: sectionType)
                        }
                    }
                }
                
            }
            else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
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
