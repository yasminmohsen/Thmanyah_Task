//
//  AudioArticleItemDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

struct AudioArticleItemDTO: Codable {
    let articleId: String
    let name: String
    let authorName: String?
    let description: String?
    let avatarURL: String?
    let duration: Int?
    let releaseDate: String?
    let score: Double?

    enum CodingKeys: String, CodingKey {
        case articleId = "article_id"
        case name
        case authorName = "author_name"
        case description
        case avatarURL = "avatar_url"
        case duration
        case releaseDate = "release_date"
        case score
    }
    
    func toDomain() -> AudioArticleItem {
        return AudioArticleItem(articleId: articleId, name: name, authorName: authorName, description: description, avatarURL: avatarURL, duration: duration, releaseDate: releaseDate, score: score)
    }
}
