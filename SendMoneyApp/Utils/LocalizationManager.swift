//
//  LocalizationManager.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

// Handles runtime language switching

import Foundation
import SwiftUI

class LocalizationManager: ObservableObject {
    @Published var locale: Locale = Locale(identifier: Locale.current.identifier)
    
    static let shared = LocalizationManager()
    
    func setLanguage(_ language: String) {
        locale = Locale(identifier: language)
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }
}
