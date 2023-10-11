//
//  Course.swift
//  P1-ExpandableButtonSheet
//
//  Created by Danilo Andrusco on 10-10-23.
//

import Foundation

//1. Crearemos una estructura para las clases
struct Course: Identifiable {
    var id: UUID = UUID()
    var name : String
    var description: String
    var imagen : String
    var type : String
    var priceLevel : Int
    var visited : Bool = false
    
    //2. Creamos el contructor
    init(name: String, description: String, imagen: String, type: String, priceLevel: Int) {
        self.name = name
        self.description = description
        self.imagen = imagen
        self.type = type
        self.priceLevel = priceLevel
        self.visited = false
    }
    
    //3. Crearemos un inicializador para un curso vacio
    init(){
        self.init(name: "", description: "", imagen: "", type: "", priceLevel: 0)
    }
}

//4. Vmoa a crear unos cursos para testeo, para ello deberemos anteponer #if DEBUG
#if DEBUG
var courses: [Course] = [
    Course(name: "Swift desde cero", 
           description: """
            Sumérgete en el mundo de la programación con Swift, el lenguaje de programación de Apple. Aprende a desarrollar aplicaciones para iOS, macOS y más en este curso de programación en Swift. Desde los conceptos básicos hasta la creación de aplicaciones completas, este curso te ayudará a dominar Swift y a convertirte en un desarrollador de aplicaciones versátil y competente.
            """,
           imagen: "swift",
           type: "Swift",
           priceLevel: 3),
    Course(name: "Python de cero a experto", 
           description: "",
           imagen: "python",
           type: "Python",
           priceLevel: 4),
    Course(name: "Interfaz grafica en Python", 
           description: "",
           imagen: "interfazPython",
           type: "Python",
           priceLevel: 2),
    Course(name: "Hacking con Python", 
           description: "",
           imagen: "hackPython",
           type: "Python",
           priceLevel: 5)
]
#endif
