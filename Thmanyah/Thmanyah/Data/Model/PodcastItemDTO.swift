//
//  PodcastItemDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

struct PodcastItemDTO: Codable, Identifiable {
    var id: String { podcastId }
    let podcastId: String
    let name: String
    let description: String?
    let avatarURL: String?
    let episodeCount: Int?
    let duration: Int?
    let language: String?
    let priority: Int?
    let popularityScore: Double?
    let score: Double?

    enum CodingKeys: String, CodingKey {
        case podcastId = "podcast_id"
        case name, description
        case avatarURL = "avatar_url"
        case episodeCount = "episode_count"
        case duration, language, priority, popularityScore, score
    }
}
