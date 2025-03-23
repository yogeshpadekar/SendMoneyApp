//
//  FieldRow.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

// Row used to show dynamic data

import SwiftUI

struct FieldRow: View {

    @ObservedObject var viewModel: SendMoneyViewModel
    let field: Field

    var body: some View {
        VStack(alignment: .leading) {

            Text(viewModel.localized(field.label))
                .font(.headline)

            TextField(
                viewModel.placeholderText(for: field),
                text: Binding(
                    get: { viewModel.formData[field.name] ?? "" },
                    set: { newValue in
                        // Apply validation only for number type
                        if field.type == "number" {
                            viewModel.formData[field.name] = newValue.filter { $0.isNumber }
                        } else {
                            viewModel.formData[field.name] = newValue
                        }
                    }
                )
            )
            .keyboardType(field.type == "number" ? .numbersAndPunctuation : .default)  // Set number pad for numeric fields
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocorrectionDisabled()
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(viewModel.formErrors[field.name] == nil ? Color.gray : Color.red, lineWidth: 1)
            )

            // Display validation errors
            if let error = viewModel.formErrors[field.name] {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
        .padding(.vertical, 5)
    }
}
