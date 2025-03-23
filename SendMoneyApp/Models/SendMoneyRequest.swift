//
//  SendMoneyRequest.swift
//  SendMoneyApp
//
//  Created by Yogesh Padekar on 22/03/25.
//

import Foundation

struct SendMoneyRequest: Identifiable, Codable {
    var id = UUID().uuidString
    var service: String
    var provider: String
    var formData: [String: String]
    var date: Date
}
