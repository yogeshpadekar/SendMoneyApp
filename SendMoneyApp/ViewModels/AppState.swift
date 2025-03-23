//
//  AppState.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

import Foundation

class AppState: ObservableObject {
    @Published var isLoggedIn = false
    @Published var savedRequests: [SendMoneyRequest] = []

    // Save request in memory
    func saveRequest(_ request: SendMoneyRequest) {
        savedRequests.append(request)
        debugPrint("Request saved in memory: \(savedRequests.count) requests.")
    }

    // Load saved requests (in-memory)
    func loadRequests() {
        debugPrint("Loaded \(savedRequests.count) requests from memory.")
    }
}

