//
//  SendMoneyView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

import SwiftUI

struct SendMoneyView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel = SendMoneyViewModel()

    // ✅ State to control toast visibility
    @State private var showToast: Bool = false
    @State private var toastMessage: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 20) {
                    // Title
                    HeaderView(title: viewModel.title)

                    // Service Picker
                    ServicePickerView(viewModel: viewModel)

                    // Provider Picker
                    ProviderPickerView(viewModel: viewModel)

                    // Dynamic Fields
                    DynamicFieldsView(viewModel: viewModel)
                        .padding(.bottom, 20)

                    // Save Button
                    SaveButtonView(viewModel: viewModel, appState: appState, onSuccess: {
                        // ✅ Show toast on successful save
                        showToastMessage("Request saved successfully!")
                    })
                        .padding(.bottom, 20)
                }
                .onAppear {
                    viewModel.loadData()
                }

                // ✅ Toast display
                if showToast {
                    VStack {
                        Spacer()
                        ToastView(message: toastMessage)
                            .padding(.bottom, 50)
                            .transition(.move(edge: .bottom))
                            .zIndex(1)
                    }
                }
            }
        }
    }

    // ✅ Function to show toast with auto-dismiss
    private func showToastMessage(_ message: String) {
        toastMessage = message
        showToast = true

        // Auto-dismiss after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showToast = false
            }
        }
    }
}

#Preview {
    SendMoneyView()
        .environmentObject(AppState())
}
