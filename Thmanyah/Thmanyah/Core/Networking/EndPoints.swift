//
//  EndPoints.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//

import Foundation

struct Endpoints {
    
    private static var homeBaseURL: URL {
        guard let url = URL(string: "https://api-v2-b2sit6oh3a-uc.a.run.app") else {
            fatalError("Invalid base URL")
        }
        return url
    }
    private static var searchBaseBaseURL: URL {
        guard let url = URL(string: "https://mock.apidog.com/m1/735111-711675-default/search") else {
            fatalError("Invalid base URL")
        }
        return url
    }
    
    // MARK: - Home Sections
    static func homeSections(page: Int = 1) -> URL {
        return homeBaseURL.appendingPathComponent("home_sections")
    }
    
    // MARK: - Search
    static func search(with item: String) -> URL {
        return searchBaseBaseURL
    }
}
