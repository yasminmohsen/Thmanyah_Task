//
//  SectionContentTypeDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

enum SectionContentTypeDTO: String, Codable {
    case podcast
    case episode
    case audioBook = "audio_book"
    case audioArticle = "audio_article"
    case unknown
}
