//
//  Transaction.swift
//  P3-AppleWallet
//
//  Created by Danilo Andrusco on 30-10-23.
//

import Foundation


struct Transaction: Identifiable {
    var id = UUID()
    var seller: String
    var amount: Double
    var date: String
    var icon: String = "dollarsign.circle.fill"
}

let transactions = [
    Transaction(seller: "Amazon", amount: 13.99, date: "06/03/2023"),
    Transaction(seller: "AliExpress", amount: 59.99, date: "11/08/2023", icon: "cart.fill"),
    Transaction(seller: "Apple", amount: 1227.00, date: "30/10/2023", icon: "gift.fill"),
    Transaction(seller: "Netflix", amount: 10.99, date: "05/11/2023", icon: "tv.circle.fill")
]
