//
//  SectionDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

struct SectionDTO: Codable {
    let name: String
    let type: SectionLayoutTypeDTO
    let contentType: String
    let order: Int
    let content: [ContentDTO]

    enum CodingKeys: String, CodingKey {
        case name, type, order, content
        case contentType = "content_type"
    }
}
