//
//  EpisodeItem.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//
import Foundation

struct EpisodeItem: Identifiable {
    var id: String { episodeId }
    let episodeId: String
    let name: String
    let podcastName: String?
    let authorName: String?
    let description: String?
    let duration: TimeInterval?
    let avatarURL: String?
    let releaseDate: String?
    let audioURL: String?
    var relativeDate: String? {
        releaseDate?.stringToRelativeDate
    }
}
//2023-01-10T08:00:00Z
// 2024-07-23T08:00:00.000Z
