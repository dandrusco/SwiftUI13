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
           priceLevel: 37000),
    Course(name: "Python de cero a experto",
           description: """
            Lorem ipsum dolor sit amet consectetur adipiscing elit turpis, mauris eget auctor gravida scelerisque lectus metus nibh, facilisi congue ad molestie eleifend primis quis. Tristique nostra ut sapien vulputate nam netus, montes eros class mauris consequat, luctus fringilla dapibus ullamcorper senectus. Laoreet nisl facilisis massa nam erat quisque eleifend turpis pulvinar orci, sodales lobortis neque volutpat mi curae mus dapibus porttitor habitasse, dis tellus vel imperdiet tempus ac eget feugiat dui.

            Conubia nec a diam nascetur nam pellentesque rutrum pretium dis, lacus feugiat morbi iaculis tempus velit auctor sagittis, platea bibendum imperdiet lectus quisque torquent donec fames. Etiam feugiat nibh vestibulum augue nam aenean imperdiet diam ullamcorper, est viverra egestas massa fermentum inceptos accumsan sapien consequat eget, dui fusce nascetur interdum curabitur sollicitudin tellus leo. Platea ante class per potenti convallis pulvinar torquent nunc aliquet lacinia blandit, ultricies duis parturient rhoncus magna id inceptos nec hac eget placerat, leo tortor arcu senectus lobortis maecenas nam pellentesque porta ligula.
            """,
           imagen: "python",
           type: "Python",
           priceLevel: 67000),
    Course(name: "Interfaz grafica en Python",
           description: "456",
           imagen: "interfazPython",
           type: "Python",
           priceLevel: 24000),
    Course(name: "Hacking con Python", 
           description: "789",
           imagen: "hackPython",
           type: "Python",
           priceLevel: 199000)
]
#endif
