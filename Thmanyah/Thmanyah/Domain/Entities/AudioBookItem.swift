//
//  AudioBookItem.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//
import Foundation

struct AudioBookItem: Identifiable {
    var id: String { audioBookId }
    let audioBookId: String
    let name: String
    let authorName: String?
    let description: String?
    let avatarURL: String?
    let duration: TimeInterval?
    let language: String?
    let releaseDate: String?
    let score: Double?
    var relativeDate: String? {
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: releaseDate ?? "") {
            return date.relativeDescription
            
        }
        return nil
    }
}
