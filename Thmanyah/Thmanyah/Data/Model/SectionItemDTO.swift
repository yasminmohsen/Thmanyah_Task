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
    let content: SectionContentDTO
    
    enum CodingKeys: String, CodingKey {
        case name, type, order, content
        case contentType = "content_type"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(SectionLayoutTypeDTO.self, forKey: .type)
        contentType = try container.decode(SectionContentTypeDTO.self, forKey: .contentType)
        order = try container.decode(Int.self, forKey: .order)
        switch contentType {
        case .podcast: content = .podcasts(try container.decode([PodcastItemDTO].self, forKey: .content))
        case .episode: content = .episodes(try container.decode([EpisodeItemDTO].self, forKey: .content))
        case .audioBook: content = .audioBooks(try container.decode([AudioBookItemDTO].self, forKey: .content))
        case .audioArticle: content = .audioArticles(try container.decode([AudioArticleItemDTO].self, forKey: .content))
        case .unknown: content = .none
        }
    }
}

extension SectionItemDTO {
    func toDomain() -> SectionItem {
        return SectionItem(
            name: name,
            type: type.toDomain(),
            contentType: SectionContentType(rawValue: contentType.rawValue) ?? .unknown,
            order: order,
            content:  mapContent()
        )
    }
    
   private func mapContent() -> SectionContent {
        switch content {
        case .podcasts(let podcasts): return .podcasts(podcasts.map({$0.toDomain()}))
        case .episodes(let episodes): return .episodes(episodes.map({$0.toDomain()}))
        case .audioBooks(let audioBooks): return .audioBooks(audioBooks.map({$0.toDomain()}))
        case .audioArticles(let audioArticles): return .audioArticles(audioArticles.map({$0.toDomain()}))
        case .none: return .none
            
        }
    }
}

