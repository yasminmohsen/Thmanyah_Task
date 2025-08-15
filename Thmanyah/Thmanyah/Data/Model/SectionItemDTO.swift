//
//  SectionItemDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//
import Foundation

struct SectionItemDTO: Codable {
    let name: String
    let type: SectionLayoutTypeDTO
    let contentType: SectionContentTypeDTO
    let order: Int
    let content: [SectionContentDTO]

    enum CodingKeys: String, CodingKey {
        case name, type, order, content
        case contentType = "content_type"
    }
}

extension SectionItemDTO {
    func toDomain() -> SectionItem {
        return SectionItem(
            name: name,
            type: type.toDomain(),
            contentType: SectionContentType(rawValue: contentType.rawValue) ?? .unknown,
            order: order,
            content: mapContent()
        )
    }
    
    private func mapContent() -> [SectionContent] {
        switch contentType {
        case .podcast:
            let podcasts = content.compactMap { item -> [PodcastItem]? in
                if case let .podcasts(dtoArray) = item {
                    return dtoArray.map { $0.toDomain() }
                }
                return nil
            }.flatMap { $0 }
            return [.podcasts(podcasts)]
            
        case .episode:
            let episodes = content.compactMap { item -> [EpisodeItem]? in
                if case let .episodes(dtoArray) = item {
                    return dtoArray.map { $0.toDomain() }
                }
                return nil
            }.flatMap { $0 }
            return [.episodes(episodes)]
            
        case .audioBook:
            let books = content.compactMap { item -> [AudioBookItem]? in
                if case let .audioBooks(dtoArray) = item {
                    return dtoArray.map { $0.toDomain() }
                }
                return nil
            }.flatMap { $0 }
            return [.audioBooks(books)]
            
        case .audioArticle:
            let articles = content.compactMap { item -> [AudioArticleItem]? in
                if case let .audioArticles(dtoArray) = item {
                    return dtoArray.map { $0.toDomain() }
                }
                return nil
            }.flatMap { $0 }
            return [.audioArticles(articles)]
            
        default:
            return []
        }
    }
}
