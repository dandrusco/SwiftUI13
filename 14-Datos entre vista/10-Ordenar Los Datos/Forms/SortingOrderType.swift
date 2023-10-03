//
//  SortingOrderType.swift
//  Forms
//
//  Created by Danilo Andrusco on 08-09-23.
//

import Foundation
enum SortingOrderType: Int, CaseIterable {
    
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
            self = .purchased
        default:
            self = .alphabetical
        }
    }
    
    var description : String {
        switch self {
        case .alphabetical:
            return "Alfabéticamente"
        case .featured:
            return "Los favoritos al inicio"
        case .purchased:
            return "Los comprados al inicio"
        }
    }
    
    //1. Ahora nos falta implemetar la opcion de ordenar los cursos para ello agregaremos una nueva funcion publica que nos devolvera un bloque de codigo en formato de tupla con un valor booleano
    func predicateSort() -> ((Course, Course) -> Bool){
        //2. Creamos los casos alfabeticamente, destacados y comprados
        switch self {
        case .alphabetical:
            return {$0.name < $1.name}
        case .featured:
            return {$0.featured && !$1.featured}
        case .purchased:
            return {$0.purchased && !$1.purchased}
        }
    }
    
}
