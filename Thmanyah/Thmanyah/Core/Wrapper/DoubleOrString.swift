//
//  DoubleOrString.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//
@propertyWrapper
struct DoubleOrString: Codable {
    var wrappedValue: Double

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let doubleVal = try? container.decode(Double.self) {
            wrappedValue = doubleVal
        } else if let strVal = try? container.decode(String.self),
                  let doubleVal = Double(strVal) {
            wrappedValue = doubleVal
        } else {
            wrappedValue = 0
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

