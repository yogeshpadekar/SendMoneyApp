//
//  DropdownView.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 23/03/25.
//

import SwiftUI

struct DropDownView: View {
    let title: String
    let options: [String]
    @Binding var selectedOption: String

    @State private var isExpanded: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            // Drop-down Button
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(selectedOption.isEmpty ? "Select \(title)" : selectedOption)
                        .foregroundColor(selectedOption.isEmpty ? .gray : .primary)

                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .animation(.easeInOut, value: isExpanded)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 1)
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2))
            }

            // ✅ Expanded Drop-down List
            if isExpanded {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(options, id: \.self) { option in
                            Button(action: {
                                selectedOption = option
                                withAnimation {
                                    isExpanded.toggle()
                                }
                            }) {
                                Text(option)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(.primary)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .background(RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color.gray, lineWidth: 0.5)
                                            .background(Color.white))
                            .cornerRadius(8)
                            .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 2)
                            .padding(.horizontal, 5)
                        }
                    }
                    .frame(maxHeight: 150)  // Limit the dropdown height
                }
                .background(RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white)
                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 3))
                .transition(.move(edge: .top).combined(with: .opacity))
                .padding(.top, 4)
            }
        }
        .padding(.horizontal)
        .animation(.easeInOut(duration: 0), value: isExpanded)
    }
}
