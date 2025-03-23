//
//  SendMoneyApp.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

import SwiftUI

@main
struct SendMoneyApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(appState)   // Inject AppState
        }
    }
}
