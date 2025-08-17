//
//  SectionContentDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//
import Foundation

enum SectionContentDTO: Codable{
    case podcasts([PodcastItemDTO])
    case episodes([EpisodeItemDTO])
    case audioBooks([AudioBookItemDTO])
    case audioArticles([AudioArticleItemDTO])
    case none
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let podcasts = try? container.decode([PodcastItemDTO].self) {
            self = .podcasts(podcasts)
        } else if let episodes = try? container.decode([EpisodeItemDTO].self) {
            self = .episodes(episodes)
        } else if let books = try? container.decode([AudioBookItemDTO].self) {
            self = .audioBooks(books)
        } else if let articles = try? container.decode([AudioArticleItemDTO].self) {
            self = .audioArticles(articles)
        } else {
            self = .none
        }
    }
}


