//
//  RequestDetailView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//

import SwiftUI

struct RequestDetailView: View {
    let request: SendMoneyRequest
    @EnvironmentObject var appState: AppState

    var body: some View {
        ScrollView {
            // ✅ JSON-formatted request data
            Text(prettyJSON(from: request))
                .font(.system(size: 14, weight: .regular, design: .monospaced))
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .foregroundColor(.black)
                .padding()
        }
        .navigationTitle(LanguageManager.shared.localizedString(forKey: "Request JSON"))
    }

    // ✅ Convert request data to pretty-formatted JSON
    private func prettyJSON(from request: SendMoneyRequest) -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let jsonData = try encoder.encode(request)
            return String(data: jsonData, encoding: .utf8) ?? "Invalid JSON"
        } catch {
            return "Failed to encode JSON: \(error)"
        }
    }
}
