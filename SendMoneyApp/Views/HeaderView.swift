//
//  HeaderView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//


import SwiftUI

struct HeaderView: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.largeTitle)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 40)
            .padding(.horizontal)
    }
}
