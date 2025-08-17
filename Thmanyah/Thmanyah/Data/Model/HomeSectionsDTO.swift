//
//  HomeSectionsDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

struct HomeSectionsDTO: Decodable {
    let sections: [SectionItemDTO]
    var pagination: PaginationDTO?
    
    enum CodingKeys: String, CodingKey {
        case sections = "sections"
        case pagination = "pagination"
    }
    func toDomain() -> HomeSections {
        return HomeSections(sections: sections.map({$0.toDomain()}), pagination: pagination?.toDomain() ?? Pagination(nextPage: "0", totalPages: 0))
    }
}
