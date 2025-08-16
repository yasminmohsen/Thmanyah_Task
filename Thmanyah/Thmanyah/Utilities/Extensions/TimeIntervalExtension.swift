//
//  TimeIntervalExtension.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 16/08/2025.
//
import Foundation

extension TimeInterval {
    var formattedDuration: String {
        guard self > 0 else { return " " }
        let totalMinutes = Int(self / 60)
        let hours = totalMinutes / 60
        let minutes = totalMinutes % 60

        if hours > 0 {
            return "\(hours)h \(minutes) min"
        } else {
            return "\(minutes) min"
        }
    }
}
