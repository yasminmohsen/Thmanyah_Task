//
//  SectionLayoutTypeDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

enum SectionLayoutTypeDTO: Codable {
    case square
    case twoLinesGrid
    case bigSquare
    case queue
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(String.self).lowercased()
        
        if value == "square" {
            self = .square
        } else if value == "2_lines_grid" {
            self = .twoLinesGrid
        } else if value == "big_square" || value == "big square" {
            self = .bigSquare
        } else if value == "queue" {
            self = .queue
        } else {
            self = .unknown
        }
    }
    
    func toDomain() -> SectionLayoutType {
        switch self {
        case .square: return .square
        case .twoLinesGrid: return .twoLinesGrid
        case .bigSquare: return .bigSquare
        case .queue: return .queue
        case .unknown: return .unknown
        }
    }
}
