//
//  SendMoneyView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

// View showing the UI to send the request

import SwiftUI

struct SendMoneyView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel = SendMoneyViewModel()

    // State for toast notification
    @State private var showToast: Bool = false
    @State private var toastMessage: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 20) {

                    // Service Picker
                    ServicePickerView(viewModel: viewModel)

                    // Provider Picker
                    ProviderPickerView(viewModel: viewModel)

                    // Dynamic Fields
                    DynamicFieldsView(viewModel: viewModel)

                    // Save Button
                    SaveButtonView(viewModel: viewModel, appState: appState, onSuccess: {
                        showToastMessage(LanguageManager.shared.localizedString(forKey: "Request saved successfully!"))
                    })
                        .padding(.bottom, 20)
                }
                .onAppear {
                    viewModel.loadData()
                }

                // Toast Display
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
            .navigationTitle(LanguageManager.shared.localizedString(forKey: "Send Money"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    LanguageButton()
                }

                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: SavedRequestsView()) {
                        Image(systemName: "tray.full")
                            .font(.title2)
                            .foregroundColor(.blue)
                            .accessibilityLabel(LanguageManager.shared.localizedString(forKey: "View Requests"))
                    }
                }
            }
        }
    }

    // Toast message
    private func showToastMessage(_ message: String) {
        toastMessage = message
        showToast = true

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
