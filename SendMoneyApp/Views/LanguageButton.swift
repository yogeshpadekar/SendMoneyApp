//
//  LanguageButton.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//


import SwiftUI

struct LanguageButton: View {
    var body: some View {
        NavigationLink(destination: LanguageSwitcherView()) {
            Image(systemName: "globe")
                .font(.title2)
                .foregroundColor(.blue)
                .accessibilityLabel(LanguageManager.shared.localizedString(forKey: "Change Language"))
        }
    }
}
