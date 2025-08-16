//
//  ContentView.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HomeViewModel(fetchHomeSectionsUseCase: FetchHomeSectionsUseCase(homeRepo: HomeRepository(remoteDataSource: HomeRemoteDataSource(networkManager: NetworkManager.shared))))
    
    var body: some View {
            List {
                ForEach(viewModel.sections, id: \.id) { section in
                    Text("\(section.name)")
//                    Section(header: Text(section.name).font(.headline)) {
//                       
//                        switch section.content {
//                        case .podcasts(let podcasts):
//                            ForEach(podcasts, id: \.podcastId) { podcast in
//                                buildView(Data: podcast, layoutType: section.type)
//                            }
//
//                        case .episodes(let episodes):
//                            ForEach(episodes, id: \.episodesId) { episode in
//                                buildView(Data: episodes, layoutType: section.type)
//                            }
//
//                        case .audioBooks(let books):
//                            ForEach(audioBooks, id: \.audioBookId) { audioBook in
//                                buildView(Data: audioBook, layoutType: section.type)
//                            }
//
//                        case .audioArticles(let articles):
//                            ForEach(articles, id: \.articleId) { article in
//                                buildView(Data: article, layoutType: section.type)
//                            }
//
//                        case .none:
//                            Text("No content")
//                                .foregroundColor(.secondary)
//                        }
//                    }
                }
            }
            .task {
                await viewModel.loadInitialSections()
            }
     
        }
    

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
        }
    

#Preview {
    ContentView()
}

