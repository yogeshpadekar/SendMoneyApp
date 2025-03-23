//
//  DynamicFieldsView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//

// Struct responsible to generate dynamic fields

import SwiftUI

struct DynamicFieldsView: View {
    @ObservedObject var viewModel: SendMoneyViewModel
    @FocusState private var focusedField: String?  // Track focused field

    var body: some View {
        ScrollView {
            ForEach(viewModel.fields, id: \.name) { field in
                VStack(alignment: .leading) {

                    // Field Label
                    let localizedLabel = LanguageManager.shared.localizedFromJSON(dict: field.label)
                        ?? LanguageManager.shared.localizedString(forKey: "Field")

                    Text(localizedLabel)
                        .font(.headline)

                    // TextField with Submit Navigation
                    TextField(
                        field.placeholder?.value ?? LanguageManager.shared.localizedString(forKey: "Enter value"),
                        text: Binding(
                            get: { viewModel.formData[field.name] ?? "" },
                            set: { newValue in
                                // Filter invalid characters for number fields
                                if field.type == "number" {
                                    viewModel.formData[field.name] = newValue.filter { $0.isNumber }
                                } else {
                                    viewModel.formData[field.name] = newValue
                                }
                            }
                        )
                    )
                    .keyboardType(field.type == "number" ? .decimalPad : .default)
                    .focused($focusedField, equals: field.name)  // Attach focus state
                    .submitLabel(viewModel.isLastField(field) ? .done : .next)
                    .textInputAutocapitalization(.never)     // No capitalization
                    .disableAutocorrection(true)             // No autocorrection
                    .onSubmit {
                        moveToNextField(after: field.name)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(viewModel.formErrors[field.name] == nil ? Color.gray : Color.red, lineWidth: 1)
                    )

                    // Display validation error
                    if let error = viewModel.formErrors[field.name] {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.footnote)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
            }
        }
    }

    // Move focus to the next field or dismiss the keyboard
    private func moveToNextField(after currentField: String) {
        let fieldNames = viewModel.fields.map { $0.name }

        if let currentIndex = fieldNames.firstIndex(of: currentField),
           currentIndex < fieldNames.count - 1 {
            // Move to the next field
            focusedField = fieldNames[currentIndex + 1]
        } else {
            // Dismiss the keyboard when on the last field
            focusedField = nil
        }
    }
}
