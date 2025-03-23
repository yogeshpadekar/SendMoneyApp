//
//  LanguageManager.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//


import SwiftUI

class LanguageManager: ObservableObject {
    static let shared = LanguageManager()
    @EnvironmentObject var appState: AppState
    private var bundle: Bundle = .main

    // ✅ Set the language at runtime
    func setLanguage(_ language: String) {
        if let path = Bundle.main.path(forResource: language, ofType: "lproj"),
           let newBundle = Bundle(path: path) {
            bundle = newBundle
        } else {
            bundle = .main
        }

        // ✅ Notify the app to reload the localization instantly
        objectWillChange.send()
    }

    // ✅ Get localized string dynamically
    func localizedString(forKey key: String) -> String {
        return NSLocalizedString(key, tableName: nil, bundle: bundle, value: "\(key)", comment: "")
    }

    func localizedFromJSON(dict: [String: String]) -> String? {
        guard !dict.isEmpty else {
            return nil
        }
        guard let language = UserDefaults.standard.string(forKey: Constants.userDefaultsLanguageKey) else { return Constants.englishLanguageKey }
        return dict[language] ?? dict[Constants.englishLanguageKey]
    }
}
