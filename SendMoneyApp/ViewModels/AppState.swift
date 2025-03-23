//
//  AppState.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

import Foundation

class AppState: ObservableObject {
    @Published var isLoggedIn = false
    @Published var savedRequests: [SendMoneyRequest] = []

    // ✅ Store language selection in UserDefaults
    @Published var selectedLanguage: String {
        didSet {
            // ✅ Persist the selected language
            UserDefaults.standard.set(selectedLanguage, forKey: Constants.userDefaultsLanguageKey)
            
            // ✅ Apply new language instantly
            LanguageManager.shared.setLanguage(selectedLanguage)
        }
    }

    init() {
        selectedLanguage = UserDefaults.standard.string(forKey: Constants.userDefaultsLanguageKey) ?? Constants.englishLanguageKey
        LanguageManager.shared.setLanguage(selectedLanguage)
    }

    // Save request in memory
    func saveRequest(_ request: SendMoneyRequest) {
        savedRequests.append(request)
        debugPrint("Request saved in memory: \(savedRequests.count) requests.")
    }
}
