//
//  Field+Extension.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

// Class Extensions

import Foundation

// MARK: - Safe Array Access
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

// MARK: - Localization
extension StringOrDict {
    /// Localizes `StringOrDict` types
    var localized: String {
        switch self {
        case .string(let str):
            return str.localized
        case .dictionary(let dict):
            return LanguageManager.shared.localizedFromJSON(dict: dict) ?? LanguageManager.shared.localizedString(forKey: "N/A")
        case .none:
            return ""
        }
    }
}

extension String {
    /// Localizes the string based on the current locale
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}

// MARK: - Localization Extension for SendMoneyViewModel
extension SendMoneyViewModel {

    /// Localizes a dictionary based on the current locale
    func localized(_ dict: [String: String]) -> String {
        LanguageManager.shared.localizedFromJSON(dict: dict) ?? LanguageManager.shared.localizedString(forKey: "N/A")
    }

    /// Localizes a `StringOrDict` value
    func localized(_ value: StringOrDict) -> String {
        switch value {
        case .string(let str):
            return str
        case .dictionary(let dict):
            return LanguageManager.shared.localizedFromJSON(dict: dict) ?? LanguageManager.shared.localizedString(forKey: "N/A")
        case .none:
            return ""
        }
    }

    /// Retrieves the placeholder text from the field with localization
    func placeholderText(for field: Field) -> String {
        switch field.placeholder {
        case .string(let value):
            return value
        case .dictionary(let dict):
            return localized(dict)
        default:
            return ""
        }
    }
}

