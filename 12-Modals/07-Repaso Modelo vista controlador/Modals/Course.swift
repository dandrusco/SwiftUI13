//
//  Corse.swift
//  Modals
//
//  Created by Danilo Andrusco on 31-08-23.
//

import Foundation

struct Course : Identifiable {
    var id = UUID()
    var name : String
    var imagen : String
    var destacado : Bool = false
    //3. Esto es de micha utilidad ya que por ejmplo ahora colocaremos una descripcion del curso
    var description : String = ""
}
