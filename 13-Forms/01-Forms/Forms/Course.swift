//
//  Course.swift
//  Forms
//
//  Created by Danilo Andrusco on 04-09-23.
//

import Foundation

struct Course : Identifiable {
    var id = UUID()
    var name : String
    var imagen : String
    //6. Agregaremnos nuevas variables, empenzando por el tipo de curso
    var type : String
    //7. Crearemos otra para ordenar el valor del curso
    var priceLevel : Int
    var destacado : Bool = false
    //8. Crearemos otra variable para ver si el curso esta comprado o no
    var purchased: Bool = false
}
