//
//  LanguageManager.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//

// Class to manage dynamic language switch

import Foundation

class LanguageManager: ObservableObject {
    static let shared = LanguageManager()

    private var bundle: Bundle = .main

    // Dynamically load the language bundle
    func setLanguage(_ language: String) {
        if let path = Bundle.main.path(forResource: language, ofType: "lproj"),
           let newBundle = Bundle(path: path) {
            bundle = newBundle
        } else {
            bundle = .main
        }
        objectWillChange.send()
    }

    // Localized string method with placeholder support
    func localizedString(forKey key: String, arguments: CVarArg...) -> String {
        let format = NSLocalizedString(key, tableName: nil, bundle: bundle, value: "\(key)", comment: "")
        return String(format: format, arguments: arguments)
    }

    func localizedFromJSON(dict: [String: String]) -> String? {
        guard !dict.isEmpty else {
            return nil
        }
        guard let language = UserDefaults.standard.string(forKey: Constants.userDefaultsLanguageKey) else { return Constants.englishLanguageKey }
        return dict[language] ?? dict[Constants.englishLanguageKey]
    }
}
