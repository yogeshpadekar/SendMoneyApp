//
//  ProviderPickerView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//


import SwiftUI

struct ProviderPickerView: View {
    @ObservedObject var viewModel: SendMoneyViewModel

    var body: some View {
        DropDownView(
            title: "Provider",
            options: viewModel.providers.map { $0.name },
            selectedOption: Binding(
                get: {
                    viewModel.providers.indices.contains(viewModel.selectedProviderIndex) ?
                    viewModel.providers[viewModel.selectedProviderIndex].name :
                    ""
                },
                set: { newValue in
                    if let index = viewModel.providers.firstIndex(where: { $0.name == newValue }) {
                        viewModel.selectedProviderIndex = index
                        viewModel.updateFields()  // ✅ Update fields dynamically
                    }
                }
            )
        )
        .padding(.horizontal)
    }
}
