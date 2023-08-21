//
//  ContentView.swift
//  list
//
//  Created by Danilo Andrusco on 21-08-23.
//

import SwiftUI

struct ContentView: View {
    //1. Si nosotros agregamos otro curso, pero no agregamos otra imagen, esto nos dara un error
    //4. Ahora podemos eliminar tanto courseName y courseImage
    /*var courseName = ["Swift desde cero",
                      "Python de cero a experto",
                      "Interfaz grafica en Python",
                      "Hacking con Python"]
    
    var courseImage = ["swift",
                       "python",
                       "interfazPython",
                       "hackPython"]*/
    
    //3. Podemos combinar los arrays de courseName y courseImage
    var courses = [
        Course(name: "Swift desde cero", imagen: "swift"),
        Course(name: "Python de cero a experto", imagen: "python"),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython"),
        Course(name: "Hacking con Python", imagen: "hackPython")
    ]
    
    var body: some View {
        //7. Como optatibo podemos eliminar VStack para que no quede todo tan centrodo eliminando el padding de mas abajo
        /*VStack {*/
            //5. Deberemos adaptar este codigo:
            /*List(courseName.indices, id: \.self) { index in
                HStack {
                    Image(courseImage[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipped()
                        .cornerRadius(30)
                    Text(courseName[index])
                }*/
            //6. Dejandolo asi:
        List(courses, id: \.name) { course in
            HStack {
                Image(course.imagen)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipped()
                    .cornerRadius(30)
                Text(course.name)
            }
        }
        /*}
        .padding()*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//2. Para ello crearemos una estructura de curso con el tipo de dato
struct Course {
    var name : String
    var imagen : String
}
