//
//  LanguageSwitcherView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//


// UI for switching languages at runtime

import SwiftUI

struct LanguageSwitcherView: View {
    @EnvironmentObject var localizationManager: LocalizationManager
    
    var body: some View {
        VStack {
            HStack {
                Text("Language:")
                Picker("Language", selection: $localizationManager.locale) {
                    Text("English").tag(Locale(identifier: "en"))
                    Text("العربية").tag(Locale(identifier: "ar"))
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: localizationManager.locale) {
                    localizationManager.setLanguage(localizationManager.locale.identifier)
                }
            }
            .padding()
        }
    }
}
