//
//  PaginationDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

struct PaginationDTO: Codable {
    let nextPage: String
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case nextPage = "next_page"
        case totalPages = "total_pages"
    }
    
    func toDomain() -> Pagination {
        return Pagination(nextPage: nextPage, totalPages: totalPages)
    }
}
