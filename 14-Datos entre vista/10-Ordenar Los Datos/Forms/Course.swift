//
//  Course.swift
//  Forms
//
//  Created by Danilo Andrusco on 04-09-23.
//

import Foundation

struct Course: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var type: String
    var priceLevel: Int
    var featured: Bool = false
    var purchased: Bool = false
}
