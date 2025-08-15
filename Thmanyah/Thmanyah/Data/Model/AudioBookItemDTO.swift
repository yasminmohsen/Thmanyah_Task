//
//  AudioBookItemDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

struct AudioBookItemDTO: Codable, Identifiable {
    var id: String { audioBookId }
    let audioBookId: String
    let name: String
    let authorName: String?
    let description: String?
    let avatarURL: String?
    let duration: Int?
    let language: String?
    let releaseDate: String?
    let score: Double?

    enum CodingKeys: String, CodingKey {
        case audioBookId = "audiobook_id"
        case name
        case authorName = "author_name"
        case description
        case avatarURL = "avatar_url"
        case duration, language
        case releaseDate = "release_date"
        case score
    }
}
