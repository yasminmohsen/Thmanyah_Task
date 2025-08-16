//
//  StringExtension.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import Foundation

extension String {
    var stringToRelativeDate: String? {
           
            // Try first with fractional seconds
            if let date = ISO8601DateFormatter.withOrWithoutFractional.date(from: self) {
                return date.relativeDescription
            }
            
            // If that fails, fallback without fractional seconds
            let fallbackFormatter = ISO8601DateFormatter()
            fallbackFormatter.formatOptions = [.withInternetDateTime]
            
        if let date = fallbackFormatter.date(from: self) {
                return date.relativeDescription
            }
            
            return nil
        }
}
 
