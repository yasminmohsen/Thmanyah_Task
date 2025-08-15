//
//  HomeSectionsDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

struct HomeSectionsDTO: Decodable {
    let sections: [SectionItemDTO]
    let pagination: PaginationDTO
    
    enum CodingKeys: String, CodingKey {
        case pagination = "pagination"
        case sections = "sections"
    }
    func toDomain() -> HomeSections {
        return HomeSections(sections: sections.map({$0.toDomain()}), pagination: pagination.toDomain())
    }
}
