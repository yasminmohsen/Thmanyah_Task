//
//  EpisodeItem.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

struct EpisodeItem: Identifiable {
    var id: String { episodeId }
    let episodeId: String
    let name: String
    let podcastName: String?
    let authorName: String?
    let description: String?
    let duration: Int?
    let avatarURL: String?
    let releaseDate: String?
    let audioURL: String?
}
