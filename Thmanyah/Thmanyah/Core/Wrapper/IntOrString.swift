//
//  IntOrString.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

/// Can decode either Int or String and expose as Int
@propertyWrapper
struct IntOrString: Codable {
    var wrappedValue: Int

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let intVal = try? container.decode(Int.self) {
            wrappedValue = intVal
        } else if let strVal = try? container.decode(String.self),
                  let intVal = Int(strVal) {
            wrappedValue = intVal
        } else {
            wrappedValue = 0
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

