//
//  SendMoneyRequestTests.swift
//  SendMoneyAppTests
//
//  Created by Yogesh Padekar on 23/03/25.
//

import XCTest
@testable import SendMoneyApp

final class SendMoneyRequestTests: XCTestCase {

    // Test Initialization
    func testRequestInitialization() {
        let request = SendMoneyRequest(
            service: "bank_transfer",
            provider: "ABC Bank",
            formData: ["amount": "100"],
            date: Date()
        )

        XCTAssertEqual(request.service, "bank_transfer", "Service should match")
        XCTAssertEqual(request.provider, "ABC Bank", "Provider should match")
        XCTAssertEqual(request.formData["amount"], "100", "Amount should match")
    }

    // Test Unique IDs
    func testRequestIDGeneration() {
        let request1 = SendMoneyRequest(
            service: "wallet_transfer",
            provider: "XYZ Wallet",
            formData: ["msisdn": "+1234567890"],
            date: Date()
        )

        let request2 = SendMoneyRequest(
            service: "wallet_transfer",
            provider: "XYZ Wallet",
            formData: ["msisdn": "+1234567890"],
            date: Date()
        )

        XCTAssertNotEqual(request1.id, request2.id, "IDs should be unique")
    }
}
