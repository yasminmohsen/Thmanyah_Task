//
//   UIContentItemMapper.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

struct UIContentItemMapper {
    static func map(_ item: any Identifiable) -> UIContentItem {
        switch item {
        case let podcast as PodcastItem:
            return UIContentItem(
                id: podcast.id,
                title: podcast.name,
                subtitle: podcast.description,
                imageURL: podcast.avatarURL,
                duration: podcast.duration,
                releaseDate: nil,
                episodesCount: podcast.episodeCount
            )
            
        case let episode as EpisodeItem:
            return UIContentItem(
                id: episode.id,
                title: episode.name,
                subtitle: episode.description,
                imageURL: episode.avatarURL,
                duration: episode.duration,
                releaseDate: episode.relativeDate,
                episodesCount: nil
            )
            
        case let audioBook as AudioBookItem:
            return UIContentItem(
                id: audioBook.id,
                title: audioBook.name,
                subtitle: audioBook.description,
                imageURL: audioBook.avatarURL,
                duration: audioBook.duration,
                releaseDate: audioBook.relativeDate,
                episodesCount: nil
            )
            
        case let audioArticle as AudioArticleItem:
            return UIContentItem(
                id: audioArticle.id,
                title: audioArticle.name,
                subtitle: audioArticle.description,
                imageURL: audioArticle.avatarURL,
                duration: audioArticle.duration,
                releaseDate: audioArticle.relativeDate,
                episodesCount: nil
            )
            
        default:
            return UIContentItem(
                id: "",
                title: "Unknown",
                subtitle: nil,
                imageURL: nil,
                duration: nil,
                releaseDate: nil,
                episodesCount: nil
            )
        }
    }
}
