//
//  AudioBookItem.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

struct AudioBookItem: Identifiable {
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
}
