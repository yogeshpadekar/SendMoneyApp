//
//  LanguageManagerTests.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//

import XCTest
@testable import SendMoneyApp

final class LanguageManagerTests: XCTestCase {

    var languageManager: LanguageManager!



    override func setUpWithError() throws {
        languageManager = LanguageManager.shared
    }

    override func tearDownWithError() throws {
        languageManager = nil
    }

    // Test Localization with Placeholder
    func testLocalizationWithPlaceholder() {
        let localizedString = languageManager.localizedString(
            forKey: "Service: %@", arguments: "Bank Transfer"
        )

        XCTAssertTrue(localizedString.contains("Bank Transfer"), "Localized string should include placeholder value")
    }

    // Test Language Switching
    func testLanguageSwitching() {
        languageManager.setLanguage("ar")
        let localized = languageManager.localizedString(forKey: "Send Money")
        XCTAssertEqual(localized, "إرسال الأموال", "Language should switch to Arabic")
    }

    // Test JSON Localization
    func testLocalizedFromJSON() {
        let jsonDict = ["en": "Send Money", "ar": "إرسال الأموال"]
        let localized = languageManager.localizedFromJSON(dict: jsonDict, languageCode: "ar")

        XCTAssertEqual(localized, "إرسال الأموال", "Localized string should be in Arabic")
    }
}
