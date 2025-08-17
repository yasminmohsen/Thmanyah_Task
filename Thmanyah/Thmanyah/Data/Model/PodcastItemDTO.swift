//
//  PodcastItemDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//
import Foundation

struct PodcastItemDTO: Codable {
    let podcastId: String
    let name: String
    let description: String?
    let avatarURL: String?
    @FlexibleCodable<Int> var episodeCount: Int?
    @FlexibleCodable<Int> var duration: Int?
    let language: String?
    @FlexibleCodable<Int> var priority: Int?
    @FlexibleCodable<Int> var popularityScore: Int?
    @FlexibleCodable<Double> var score: Double?

    enum CodingKeys: String, CodingKey {
        case podcastId = "podcast_id"
        case name, description
        case avatarURL = "avatar_url"
        case episodeCount = "episode_count"
        case duration, language, priority, popularityScore, score
    }
    
    func toDomain() -> PodcastItem {
        return PodcastItem(podcastId: podcastId, name: name, description: description, avatarURL: avatarURL, episodeCount: episodeCount, duration: duration.map({TimeInterval($0)}), language: language, priority: priority, popularityScore: popularityScore, score: score)
    }
}
