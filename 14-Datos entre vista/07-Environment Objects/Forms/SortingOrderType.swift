//
//  SortingOrderType.swift
//  Forms
//
//  Created by Danilo Andrusco on 08-09-23.
//

import Foundation

enum SortingOrderType : Int, CaseIterable {
    
    case alphabetical = 0
    case featured = 1
    case purchased = 2
    
    init(type: Int) {
        switch type {
        case 0:
            self = .alphabetical
        case 1:
            self = .featured
        case 2:
            self = . featured
        default:
            self = .alphabetical
        }
    }
    
    var description : String {
        switch self {
        case .alphabetical:
            return "Cursos"
        case .featured:
            return "Los favoritos"
        case . purchased:
            return "Comprados"
        }
    }
}
