//
//  FlixableCodable.swift
//  Thmanyah
//
//  Created by Yasmin Mohsen on 17/08/2025.
//

@propertyWrapper
struct FlexibleCodable<T: LosslessStringConvertible & Codable>: Codable {
    var wrappedValue: T?

    init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let value = try? container.decode(T.self) {
            wrappedValue = value
        } else if let str = try? container.decode(String.self),
                  let converted = T(str) {
            wrappedValue = converted
        } else {
            wrappedValue = nil
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let value = wrappedValue {
            try container.encode(value)
        } else {
            try container.encodeNil()
        }
    }
}
