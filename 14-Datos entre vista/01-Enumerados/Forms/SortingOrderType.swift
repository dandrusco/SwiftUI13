//
//  SortingOrderType.swift
//  Forms
//
//  Created by Danilo Andrusco on 08-09-23.
//

import Foundation
//2. Crearemos un enumerado identificado por numero enteros e iterable
enum SortingOrderType : Int, CaseIterable {
    //3. Tomaremos los diferentes valores que tomara el enumerado
    case alphabetical = 0
    case featured = 1
    case purchased = 2
    
    //4. Crearemos un constructor, que segun lo que reciba (Int) devuelva algo incluyendo un defaul en el caso de que alguien teclara un numero superior al case sera de tipo alphabetical
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
    
    //5. Crearemos una variable autocomputada de tipo String ya que tomara el valor en base a self para mostrar la descripcion
    var description : String {
        switch self {
        case .alphabetical:
            return "Cursos"
        case .featured:
            return "Los favoritos"
        case . purchased:
            return "Comprados"
        //6. No hace falta el valor por defecto por que self es una instancia de SortingOrderType solo puede valoer uno de estos tres
        }
    }
}
