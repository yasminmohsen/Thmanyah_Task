//
//  SectionItem.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

import Foundation

struct SectionItem: Identifiable {
    let id = UUID()
    let name: String
    let type: SectionLayoutType
    let contentType: SectionContentType
    let order: Int
    let content: SectionContent
}
