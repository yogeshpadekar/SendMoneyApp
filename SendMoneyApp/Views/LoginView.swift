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
        ZStack {
            // ✅ Background gradient matching the app theme
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.mint]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                // ✅ App Logo or Title
                VStack {
                    Image(systemName: "person.crop.circle.fill.badge.checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)

                    Text(LanguageManager.shared.localizedString(forKey: "LOGIN"))
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                }

                // ✅ Input Fields
                VStack(spacing: 20) {
                    CustomTextField(icon: "person.fill",
                                    placeholder: LanguageManager.shared.localizedString(forKey: "Username"),
                                    text: $username)

                    CustomSecureField(icon: "key.fill",
                                      placeholder: LanguageManager.shared.localizedString(forKey: "Password"),
                                      text: $password)
                }
                .padding(.horizontal, 30)

                // ✅ Login Button
                Button(action: handleLogin) {
                    Text(LanguageManager.shared.localizedString(forKey: "LOGIN"))
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                }
                .padding(.horizontal, 30)

                // ✅ Error Message
                if showError {
                    Text(LanguageManager.shared.localizedString(forKey: "InvalidCredentials"))
                        .foregroundColor(.red)
                        .font(.body)
                }

                Spacer()
            }
            .padding(.top, 50)
        }
        .fullScreenCover(isPresented: $appState.isLoggedIn) {
            SendMoneyView().environmentObject(appState)
        }
    }

    // ✅ Handle Login Logic
    private func handleLogin() {
        if username.lowercased() == "testuser" && password == "password123" {
            appState.isLoggedIn = true
        } else {
            showError = true
        }
    }
}

// ✅ Custom TextField Component
struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)

            TextField(placeholder, text: $text)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.vertical, 12)
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

// ✅ Custom SecureField Component
struct CustomSecureField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)

            SecureField(placeholder, text: $text)
                .padding(.vertical, 12)
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    LoginView()
        .environmentObject(AppState())
}
