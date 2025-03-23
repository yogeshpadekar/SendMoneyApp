//
//  StringOrDict.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//


import Foundation

enum StringOrDict: Codable {
    case string(String)
    case dictionary([String: String])
    case none

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
        } else if let dictValue = try? container.decode([String: String].self) {
            self = .dictionary(dictValue)
        } else {
            self = .none
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .string(let stringValue):
            try container.encode(stringValue)
        case .dictionary(let dictValue):
            try container.encode(dictValue)
        case .none:
            try container.encodeNil()
        }
    }

    // Access safe value
    var value: String {
        switch self {
        case .string(let stringValue):
            return stringValue
        case .dictionary(let dictValue):
            return LanguageManager.shared.localizedFromJSON(dict: dictValue) ?? ""
        case .none:
            return ""
        }
    }
}
