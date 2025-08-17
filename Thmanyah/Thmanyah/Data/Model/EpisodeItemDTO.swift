//
//  EpisodeItemDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//
import Foundation

struct EpisodeItemDTO: Codable {
    let episodeId: String
    let name: String
    let podcastName: String?
    let authorName: String?
    let description: String?
    let duration: Int?
    let avatarURL: String?
    let releaseDate: String?
    let audioURL: String?
    
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case name
        case podcastName = "podcast_name"
        case authorName = "author_name"
        case description
        case duration
        case avatarURL = "avatar_url"
        case releaseDate = "release_date"
        case audioURL = "audio_url"
    }
    
    func toDomain() -> EpisodeItem {
        return EpisodeItem(episodeId: episodeId, name: name, podcastName: podcastName, authorName: authorName, description: description, duration: duration.map({TimeInterval($0)}), avatarURL: avatarURL, releaseDate: releaseDate, audioURL: audioURL)
    }
}
