//
//  SendMoneyViewModelTests.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//

import XCTest
@testable import SendMoneyApp

final class SendMoneyViewModelTests: XCTestCase {

    var viewModel: SendMoneyViewModel!

    override func setUpWithError() throws {
        viewModel = SendMoneyViewModel()
        viewModel.loadData()  // Load JSON data
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    // Test JSON Loading
    func testLoadData() {
        XCTAssertFalse(viewModel.services.isEmpty, "Services should be loaded from JSON")
    }

    // Test Provider Update
    func testUpdateProviders() {
        viewModel.selectedServiceIndex = 0
        viewModel.updateProviders()
        XCTAssertFalse(viewModel.providers.isEmpty, "Providers should be populated for the selected service")
    }

    // Test Fields Update
    func testUpdateFields() {
        viewModel.selectedServiceIndex = 0
        viewModel.updateProviders()
        viewModel.selectedProviderIndex = 0
        viewModel.updateFields()

        XCTAssertFalse(viewModel.fields.isEmpty, "Fields should be populated for the selected provider")
    }

    // Test Validation - Empty Field
    func testValidationEmptyField() {
        viewModel.formData["amount"] = ""

        let isValid = viewModel.validateForm()

        XCTAssertFalse(isValid, "Validation should fail for empty fields")
        XCTAssertNotNil(viewModel.formErrors["amount"], "Amount field should have an error")
    }

    // Test Validation - Invalid Number
    func testValidationInvalidNumber() {
        viewModel.formData["amount"] = "abc"  // Invalid number

        let isValid = viewModel.validateForm()

        XCTAssertFalse(isValid, "Validation should fail for non-numeric value in number field")
        XCTAssertNotNil(viewModel.formErrors["amount"], "Amount field should have an error")
    }
}
