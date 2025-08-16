//
//  ContentView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

import SwiftUI

struct ContentView: View {
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
                        
                        // Show big cards in a paged TabView
                        if section.type == .bigSquare {
                            TabView {
                                ForEach(0..<5) { _ in
                                    cardView(for: section.type)
                                }
                            }
                            .frame(height: 200)
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            
                        } else if section.type == .twoLinesGrid{
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                    ForEach(0..<5) { _ in
                                        cardView(for: section.type)
                                    }
                                }
                            }
                          
                        }
                        else {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0) {
                                    ForEach(0..<5) { _ in
                                        cardView(for: section.type)
                                    }
                                }
                            }
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
    func cardView(for layout: SectionLayoutType) -> some View {
        switch layout {
        case .square:
            SquareCardView()
        case .bigSquare:
            BigSquareCardView()
        case .queue:
            QueueCardView()
        case .twoLinesGrid:
            TwoLinesGridCardView()
        case .unknown:
            EmptyView()
        }
    }
}

#Preview {
    ContentView()
}



//            List {
//                ForEach(viewModel.sections, id: \.id) { section in
//                    Text("\(section.name)")
//
////                    Section(header: Text(section.name).font(.headline)) {
////
////                        switch section.content {
////                        case .podcasts(let podcasts):
////                            ForEach(podcasts, id: \.podcastId) { podcast in
////                                buildView(Data: podcast, layoutType: section.type)
////                            }
////
////                        case .episodes(let episodes):
////                            ForEach(episodes, id: \.episodesId) { episode in
////                                buildView(Data: episodes, layoutType: section.type)
////                            }
////
////                        case .audioBooks(let books):
////                            ForEach(audioBooks, id: \.audioBookId) { audioBook in
////                                buildView(Data: audioBook, layoutType: section.type)
////                            }
////
////                        case .audioArticles(let articles):
////                            ForEach(articles, id: \.articleId) { article in
////                                buildView(Data: article, layoutType: section.type)
////                            }
////
////                        case .none:
////                            Text("No content")
////                                .foregroundColor(.secondary)
////                        }
////                    }
//                }
//            }




/*func buildView(Data: Identifiable, layoutType: SectionLayoutType) -> View {
 // convert item to the exact type -> podcasts, episodes..etc
 let item = mapValue(from: data)
 if layoutType == .bigSquare {
 return BigSquareView(item: item)
 } else if layoutType == .queue {
 return Queuee(item: item)
 } // AND SO ON FOR OTHER LAYOUT TYPES
 }
 func mapValue(from item: Identifiable) -> UIContentItem {
 if let podcastItem as PodcastItem {
 UIContentItem(id: podcastitem.id, title: podcastitem.name, subtitle: podcastitem.description, imageURL: <#T##URL?#>, duration: <#T##TimeInterval?#>, type: <#T##<<error type>>#>, extra: <#T##[String : Any]#>)
 }
 // and so on for other type..
 }*/
