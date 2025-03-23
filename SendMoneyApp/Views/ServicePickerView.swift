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
            title: "Service",
            options: viewModel.services.map { $0.label["en"] ?? "Unknown Service" },
            selectedOption: Binding(
                get: {
                    viewModel.services.indices.contains(viewModel.selectedServiceIndex) ?
                    viewModel.services[viewModel.selectedServiceIndex].label["en"] ?? "" :
                    ""
                },
                set: { newValue in
                    if let index = viewModel.services.firstIndex(where: { $0.label["en"] == newValue }) {
                        viewModel.selectedServiceIndex = index
                        viewModel.updateProviders()  // ✅ Update providers dynamically
                    }
                }
            )
        )
        .padding(.horizontal)
    }
}
