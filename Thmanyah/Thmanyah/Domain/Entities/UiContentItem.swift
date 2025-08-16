//
//  UiContentItem.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//
import Foundation

struct UIContentItem: Identifiable {
    let id: UUID
    let title: String
    let subtitle: String?
    let imageURL: URL?
    let duration: TimeInterval?
    let type: SectionContentType
    let releaseDate: String?
    let episodsCount: Int?
}
