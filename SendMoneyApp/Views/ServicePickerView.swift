//
//  ServicePickerView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//

import SwiftUI

struct ServicePickerView: View {
    @ObservedObject var viewModel: SendMoneyViewModel

    var body: some View {
        DropDownView(
            title: LanguageManager.shared.localizedString(forKey: "Service"),
            options: viewModel.services.map { LanguageManager.shared.localizedFromJSON(dict: $0.label) ?? LanguageManager.shared.localizedString(forKey: "Unknown Service") },
            selectedOption: Binding(
                get: {
                    viewModel.services.indices.contains(viewModel.selectedServiceIndex) ?
                    LanguageManager.shared.localizedFromJSON(dict: viewModel.services[viewModel.selectedServiceIndex].label) ?? "" :
                    ""
                },
                set: { newValue in
                    if let index = viewModel.services.firstIndex(where: { LanguageManager.shared.localizedFromJSON(dict: $0.label) == newValue }) {
                        viewModel.selectedServiceIndex = index
                        viewModel.updateProviders()  // ✅ Update providers dynamically
                    }
                }
            )
        )
        .padding(.horizontal)
    }
}
