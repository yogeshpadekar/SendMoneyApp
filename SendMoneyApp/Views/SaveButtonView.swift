//
//  SaveButtonView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//


import SwiftUI

struct SaveButtonView: View {
    @ObservedObject var viewModel: SendMoneyViewModel
    var appState: AppState
    var onSuccess: () -> Void  // Closure to trigger toast

    var body: some View {
        Button(LanguageManager.shared.localizedString(forKey: "SEND")) {
            viewModel.saveRequest(appState: appState)

            // Trigger the success closure only when validation passes
            if viewModel.formErrors.isEmpty {
                onSuccess()
            }
        }
        .font(.title2)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
