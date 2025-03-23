//
//  LoginView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showError = false

    var body: some View {
        VStack(spacing: 20) {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Login") {
                if username.lowercased() == "testuser" && password == "password123" {
                    appState.isLoggedIn = true
                } else {
                    showError = true
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            if showError {
                Text("Invalid credentials").foregroundColor(.red)
            }
        }
        .padding()
        .navigationTitle("Login")

        // Navigate to SendMoneyView with in-memory state management
        .fullScreenCover(isPresented: $appState.isLoggedIn) {
            SendMoneyView().environmentObject(appState)   // Pass AppState
        }
    }
}
