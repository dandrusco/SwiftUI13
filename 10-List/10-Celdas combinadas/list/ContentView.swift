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
        List(courses) { course in
            //1. Con la tecla CMD pulsada le damos boton izquierdo y le damos en extraer sublista y la llamaaremos CoursRow()
            //4. Podemos ver que ahora se nos generea el error en CoursRow() ya que deberemos modificarla
            /*CoursRow()*/
            //5. Pasandole course 
            CoursRow(course: course)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Course : Identifiable {
    var id = UUID()
    var name : String
    var imagen : String
}

struct CoursRow: View {
    //3. Para solucionarlo crearemos una variable de tipo curso
    var course : Course
    
    var body: some View {
        HStack {
            //2. Xcode se nos queja tanto en Image(course.imagen) como  en Text(course.name) ya que no tenemos course desde aqui
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
