//
//  AudioArticleItem.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

struct AudioArticleItem: Identifiable {
    var id: String { articleId }
    let articleId: String
    let name: String
    let authorName: String?
    let description: String?
    let avatarURL: String?
    let duration: Int?
    let releaseDate: String?
    let score: Double?
}
