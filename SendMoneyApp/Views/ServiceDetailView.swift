//
//  ServiceDetailView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//


// MARK: - ServiceDetailView.swift
// Displays provider details and fields, handling different placeholder types

import SwiftUI

struct ServiceDetailView: View {
    let service: Service

    var body: some View {
        List {
            ForEach(service.providers, id: \.id) { provider in
                Section(header: Text(provider.name)) {
                    ForEach(provider.requiredFields, id: \.name) { field in
                        fieldView(for: field)
                            .padding(.vertical, 4)
                    }
                }
            }
        }
        .navigationTitle(LanguageManager.shared.localizedFromJSON(dict: service.label) ?? service.name)
    }

    // MARK: - Extracted Field View
    @ViewBuilder
    private func fieldView(for field: Field) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(LanguageManager.shared.localizedFromJSON(dict: field.label) ?? field.name)
                .font(.headline)

            TextField(
                placeholderText(for: field.placeholder),
                text: .constant("")
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(field.type == "number" ? .decimalPad : .default)
        }
    }

    // MARK: - Helper to Get Placeholder Text
    private func placeholderText(for placeholder: StringOrDict?) -> String {
       let defaultPlaceholder = LanguageManager.shared.localizedString(forKey: "Enter value")
        switch placeholder {
        case .string(let value):
            return value
        case .dictionary(let dict):
            return LanguageManager.shared.localizedFromJSON(dict: dict) ?? defaultPlaceholder
        default:
            return defaultPlaceholder
        }
    }
}
