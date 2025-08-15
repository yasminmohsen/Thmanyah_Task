//
//  SectionLayoutTypeDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

enum SectionLayoutTypeDTO: String, Codable {
    case square
    case twoLinesGrid = "2_lines_grid"
    case bigSquare = "big_square"
    case queue
    case unknown
    
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
