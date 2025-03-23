//
//  FieldValidationTests.swift
//  SendMoneyAppTests
//
//  Created by Yogesh Padekar on 23/03/25.
//

import XCTest
@testable import SendMoneyApp

final class FieldValidationTests: XCTestCase {

    var viewModel: SendMoneyViewModel!

    override func setUpWithError() throws {
        viewModel = SendMoneyViewModel()
        viewModel.loadData()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    // Test Max Length Validation
    func testMaxLengthValidation() {
        viewModel.formData["bank_account_number"] = String(repeating: "1", count: 65)
        XCTAssertFalse(viewModel.validateForm(), "Exceeding max length should fail")
    }
}
