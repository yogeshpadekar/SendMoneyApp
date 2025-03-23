//
//  AppStateTests.swift
//  SendMoneyAppTests
//
//  Created by Yogesh Padekar on 23/03/25.
//

import XCTest
@testable import SendMoneyApp

final class AppStateTests: XCTestCase {

    var appState: AppState!

    override func setUpWithError() throws {
        appState = AppState()
    }

    override func tearDownWithError() throws {
        appState = nil
    }

    // Test Saving Requests
    func testSaveRequest() {
        let request = SendMoneyRequest(
            service: "bank_transfer",
            provider: "ABC Bank",
            formData: ["amount": "100"],
            date: Date()
        )

        appState.saveRequest(request)

        XCTAssertEqual(appState.savedRequests.count, 1, "Request should be saved successfully")
    }

    // Test Loading Requests
    func testLoadRequests() {
        let request = SendMoneyRequest(
            service: "wallet_transfer",
            provider: "XYZ Wallet",
            formData: ["amount": "200"],
            date: Date()
        )

        appState.saveRequest(request)

        XCTAssertEqual(appState.savedRequests.count, 1, "Should load saved requests")
    }

    // Test Language Persistence
    func testLanguagePersistence() {
        appState.selectedLanguage = "ar"
        XCTAssertEqual(appState.selectedLanguage, "ar", "Language should be Arabic")
    }
}
