//
//  SectionContentDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

enum SectionContentDTO: Codable {
    case podcasts([PodcastItemDTO])
    case episodes([EpisodeItemDTO])
    case audioBooks([AudioBookItemDTO])
    case audioArticles([AudioArticleItemDTO])
    case none
}
