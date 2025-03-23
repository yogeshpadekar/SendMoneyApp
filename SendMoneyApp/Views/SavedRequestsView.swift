//
//  SavedRequestsView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//

import SwiftUI

struct SavedRequestsView: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedRequest: SendMoneyRequest?

    var body: some View {
        NavigationStack {
            List(appState.savedRequests) { request in
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Request ID: \(request.id)")
                            .font(.caption)
                            .foregroundColor(.gray)

                        Text("Service: \(request.service)")
                            .font(.headline)
                            .foregroundColor(.primary)

                        Text("Provider: \(request.provider)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        if let amount = request.formData["amount"] {
                            Text("Amount: \(amount)")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                    Spacer()

                    // ✅ View JSON Button
                    NavigationLink(destination: RequestDetailView(request: request)) {
                        Text(LanguageManager.shared.localizedString(forKey: "View JSON"))
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                .padding(.vertical, 8)
            }
            .navigationTitle(LanguageManager.shared.localizedString(forKey: "Saved Requests"))
        }
    }
}
