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
            if let raws = try? container.decode([AnyCodable].self),
                    let promoted = SectionContentDTO.promote(raws) {
                     self = promoted
                     return
                 }
                 self = .none
        }
    }

    private static func promote(_ raws: [AnyCodable]) -> SectionContentDTO? {
           let dicts = raws.compactMap { $0.value as? [String: AnyCodable] }
           guard !dicts.isEmpty else { return nil }

           func decode<T: Decodable>(_ type: T.Type) -> T? {
               let json = dicts.map { $0.mapValues { $0.value } }
               guard let data = try? JSONSerialization.data(withJSONObject: json) else { return nil }
               return try? JSONDecoder().decode(type, from: data)
           }

           if dicts.allSatisfy({ $0.keys.contains("podcast_id") }) {
               if let podcasts: [PodcastItemDTO] = decode([PodcastItemDTO].self) {
                   return .podcasts(podcasts)
               }
           }

           if dicts.allSatisfy({ $0.keys.contains("episode_id") }) {
               if let episodes: [EpisodeItemDTO] = decode([EpisodeItemDTO].self) {
                   return .episodes(episodes)
               }
           }
        
        if dicts.allSatisfy({ $0.keys.contains("audiobook_id") }) {
            if let books: [AudioBookItemDTO] = decode([AudioBookItemDTO].self) {
                return .audioBooks(books)
            }
        }
        
        if dicts.allSatisfy({ $0.keys.contains("article_id") }) {
            if let articles: [AudioArticleItemDTO] = decode([AudioArticleItemDTO].self) {
                return .audioArticles(articles)
            }
        }
           return nil
       }
   }


