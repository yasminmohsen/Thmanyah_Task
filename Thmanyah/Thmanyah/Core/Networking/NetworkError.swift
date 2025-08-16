//
//  NetworkError.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 15/08/2025.
//
import Foundation

enum NetworkError: Error {
    case invalidResponse
    case apiError(Any)
    case unexpectedStatusCode(Int)
}

struct APIError: Codable, Error {
    let message: String
    let code: Int
}
