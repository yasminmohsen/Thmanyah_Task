//
//  UiContentItem.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//
import Foundation

struct UIContentItem: Identifiable {
    let id: String
    let title: String
    let subtitle: String?
    let imageURL: String?
    let duration: TimeInterval?
    let releaseDate: String?
    let episodesCount: Int?
}
