//
//  FormFields.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//


import SwiftUI

struct FormFields: View {
    
    @ObservedObject var viewModel: SendMoneyViewModel
    
    var body: some View {
        Form {
            ForEach(viewModel.fields, id: \.name) { field in
                FieldRow(viewModel: viewModel, field: field)
            }
        }
    }
}
