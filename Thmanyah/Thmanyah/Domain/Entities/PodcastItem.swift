//
//  PodcastItem.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

struct PodcastItem: Identifiable {
    var id: String { podcastId }
    let podcastId: String
    let name: String
    let description: String?
    let avatarURL: String?
    let episodeCount: Int?
    let duration: Int?
    let language: String?
    let priority: Int?
    let popularityScore: Int?
    let score: Double?
}
