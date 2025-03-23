//
//  LanguageSwitcherView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//


// UI for switching languages at runtime

import SwiftUI

struct LanguageSwitcherView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss

    let languages = ["en": "English", "ar": "العربية"]

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(LanguageManager.shared.localizedString(forKey: "Select Language"))
                    .font(.title)
                    .bold()

                // ✅ Language Picker
                Picker("Language", selection: $appState.selectedLanguage) {
                    ForEach(languages.keys.sorted(), id: \.self) { key in
                        Text(languages[key] ?? key).tag(key)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(height: 150)

                // ✅ Save & Dismiss Button
                Button(LanguageManager.shared.localizedString(forKey: "Save")) {
                    // ✅ Save language & apply instantly
                    LanguageManager.shared.setLanguage(appState.selectedLanguage)
                    dismiss()
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding()
            .navigationTitle(LanguageManager.shared.localizedString(forKey: "Language"))
        }
    }
}
