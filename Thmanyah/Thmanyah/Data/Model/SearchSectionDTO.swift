//
//  SearchSectionDTO.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

struct SearchSectionDTO: Decodable {
    let sections: [SectionItemDTO]
    
    enum CodingKeys: String, CodingKey {
        case sections = "sections"
    }
    
    func toDomain() -> SearchSections {
        return SearchSections(sections: sections.map({$0.toDomain()}))
    }
}
