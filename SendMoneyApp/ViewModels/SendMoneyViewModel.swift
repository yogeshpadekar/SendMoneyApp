//
//  SendMoneyViewModel.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

import SwiftUI

class SendMoneyViewModel: ObservableObject {

    // MARK: - Published Properties
    @Published var title: String = "Send Money"
    @Published var services: [Service] = []
    @Published var providers: [Provider] = []
    @Published var fields: [Field] = []
    @Published var formData: [String: String] = [:]
    @Published var formErrors: [String: String] = [:]

    @Published var selectedServiceIndex: Int = 0 {
        didSet { updateProviders() }
    }

    @Published var selectedProviderIndex: Int = 0 {
        didSet { updateFields() }
    }

    // MARK: - Load Data
    func loadData() {
        guard let url = Bundle.main.url(forResource: "SendMoneyData", withExtension: "json") else {
            print("❌ JSON file not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(SendMoneyData.self, from: data)

            title =  LanguageManager.shared.localizedFromJSON(dict: decodedData.title) ?? LanguageManager.shared.localizedString(forKey: "Send Money")
            services = decodedData.services

            updateProviders()
        } catch {
            print("❌ Failed to decode JSON: \(error)")
        }
    }

    // MARK: - Update Providers and Fields
    func updateProviders() {
        guard services.indices.contains(selectedServiceIndex) else { return }
        providers = services[selectedServiceIndex].providers
        selectedProviderIndex = 0
        updateFields()
    }

    func updateFields() {
        guard providers.indices.contains(selectedProviderIndex) else { return }
        fields = providers[selectedProviderIndex].requiredFields

        // Initialize formData and errors
        for field in fields {
            if formData[field.name] == nil {
                formData[field.name] = ""
            }
            formErrors[field.name] = nil  // Clear previous errors
        }
    }

    // MARK: - Validation Logic

    // ✅ Extract minimum length from regex pattern
    private func getMinLength(from pattern: String) -> Int? {
        let minLengthRegex = "\\{(\\d+),"

        do {
            let regex = try NSRegularExpression(pattern: minLengthRegex)
            let nsRange = NSRange(pattern.startIndex..., in: pattern)

            if let match = regex.firstMatch(in: pattern, options: [], range: nsRange),
               let range = Range(match.range(at: 1), in: pattern),
               let minLength = Int(pattern[range]) {
                return minLength
            }
        } catch {
            print("❌ Error extracting min length: \(error)")
        }

        return nil
    }

    // ✅ Check if a string contains only numerical characters
    private func isNumeric(_ value: String) -> Bool {
        let digitSet = CharacterSet.decimalDigits
        return value.unicodeScalars.allSatisfy { digitSet.contains($0) }
    }


    func validateForm() -> Bool {
        formErrors.removeAll()

        for field in fields {
            let value = formData[field.name]?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

            // ✅ 1. Empty Field Check
            if value.isEmpty {
                formErrors[field.name] = field.validationErrorMessage?.value ?? "This field is required"
                continue
            }

            // ✅ 2. Number-Only Validation for Number Fields
            if field.type == "number", !isNumeric(value) {
                formErrors[field.name] = "Only numbers are allowed"
                continue
            }

            // ✅ 3. Min & Max Length Validation
            if field.maxLength > 0, value.count > field.maxLength {
                formErrors[field.name] = "Max length is \(field.maxLength) characters"
                continue
            }

            if let minLength = getMinLength(from: field.validation), value.count < minLength {
                formErrors[field.name] = "Minimum length is \(minLength) characters"
                continue
            }

            // ✅ 4. Regex Validation
            if !field.validation.isEmpty {
                if !matchesRegex(value, pattern: field.validation) {
                    formErrors[field.name] = field.validationErrorMessage?.value ?? "Invalid format"
                }
            }
        }

        return formErrors.isEmpty
    }

    // ✅ Helper to check if the field is the last one
    func isLastField(_ field: Field) -> Bool {
        return fields.last?.name == field.name
    }

    // ✅ Strict regex validation using NSPredicate
    private func matchesRegex(_ value: String, pattern: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: value)
    }

    // MARK: - Save Request
    func saveRequest(appState: AppState) {
        guard services.indices.contains(selectedServiceIndex),
              providers.indices.contains(selectedProviderIndex) else {
            print("Invalid service or provider selection")
            return
        }

        if !validateForm() {
            print("Form validation failed: \(formErrors)")
            return
        }

        let service = services[selectedServiceIndex].name
        let provider = providers[selectedProviderIndex].name

        let request = SendMoneyRequest(
            service: service,
            provider: provider,
            formData: formData,
            date: Date()
        )

        appState.saveRequest(request)
        print("Request saved: \(request)")
        formData = [:]
    }
}
