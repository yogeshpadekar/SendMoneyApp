//
//  ToastView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//


import SwiftUI

struct ToastView: View {
    let message: String

    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding()
            .background(Color.green.opacity(0.9))
            .cornerRadius(12)
            .shadow(radius: 10)
            .transition(.opacity)
            .animation(.easeInOut(duration: 0.3), value: message)
    }
}
