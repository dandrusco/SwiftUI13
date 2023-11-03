//
//  Card.swift
//  P3-AppleWallet
//
//  Created by Danilo Andrusco on 30-10-23.
//

import Foundation

enum CardType: String {
    case visa
    case amex
    case master
    case chase
}

struct Card: Identifiable {
    var id = UUID()
    var clientName : String
    var number : String
    var expirationDate : String
    var type : CardType
    var image : String
}

let tempCards = [
    Card(clientName: "Danilo Andrusco", number: "1212 1212 1212 1212", expirationDate: "01/24", type: .visa, image: "basic"),
    Card(clientName: "Patricia Tapia", number: "3434 3434 3434 3434", expirationDate: "03/25", type: .master, image: "gold"),
    Card(clientName: "Bruno Andrusco", number: "5656 5656 5656 5656", expirationDate: "05/25", type: .master, image: "platinum"),
    Card(clientName: "Sophia Andrusco", number: "7878 7878 7878 7878", expirationDate: "07/28", type: .amex, image: "standard")
]
