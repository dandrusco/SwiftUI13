//
//  ContentView.swift
//  list
//
//  Created by Danilo Andrusco on 21-08-23.
//

import SwiftUI

struct ContentView: View {
    
    var courses = [
        Course(name: "Swift desde cero", imagen: "swift"),
        Course(name: "Python de cero a experto", imagen: "python"),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython"),
        Course(name: "Hacking con Python", imagen: "hackPython")
    ]
    
    var body: some View {
        //1. Como el id corresponde al nombre. ¿Que pasa si hay un mismo curso pero con otra imagen?, en ese caso se respetara la primera imagen obviando la segunda, para evitar ese error realizaremos unos cambios
        //3. Ahora le cambiaremos el identificador por el id creado en el punto 2
        List(courses, id: \.id) { course in
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Course {
    //2. Deberemos crear un identificador unico
    var id = UUID() //3. La inicializamos con un identificador unico proporsionado por Swift
    var name : String
    var imagen : String
}
