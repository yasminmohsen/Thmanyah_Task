//
//  HomeSectionsDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 14/08/2025.
//

struct HomeSectionsDTO: Codable {
    let sections: [SectionItemDTO]
    let pagination: PaginationDTO
    
    func toDomain() -> HomeSections {
        return HomeSections(sections: sections.map({$0.toDomain()}), pagination: pagination.toDomain())
    }
}
