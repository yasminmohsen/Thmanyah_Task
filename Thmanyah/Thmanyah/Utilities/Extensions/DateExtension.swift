//
//  DateExtension.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//

import Foundation

extension Date {
    var relativeDescription: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
