//
//  SendMoneyData.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

// Data models required to save the data

import Foundation

struct SendMoneyData: Codable {
    let title: [String: String]
    let services: [Service]
}

struct Service: Codable {
    let label: [String: String]
    let name: String
    let providers: [Provider]
}

struct Provider: Codable {
    let name: String
    let id: String
    let requiredFields: [Field]

    enum CodingKeys: String, CodingKey {
        case name, id
        case requiredFields = "required_fields"
    }
}

struct Field: Codable {
    let label: [String: String]
    let name: String
    let placeholder: StringOrDict?        // Use StringOrDict for flexible values
    let type: String
    let validation: String
    let maxLength: Int
    let validationErrorMessage: StringOrDict?  // Use StringOrDict for validation error messages

    enum CodingKeys: String, CodingKey {
        case label, name, placeholder, type, validation
        case maxLength = "max_length"
        case validationErrorMessage = "validation_error_message"
    }
}
