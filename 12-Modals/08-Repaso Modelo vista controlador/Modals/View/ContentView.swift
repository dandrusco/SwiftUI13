//
//  ContentView.swift
//  Modals
//
//  Created by Danilo Andrusco on 30-08-23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedCourse: Course?
    //1. Que pasaria si la descripcxion de cada curso fuera extensa? se veria mal tanta informacion en el ContenView. Para ello crearemos un nuevo fichero de tipo Swift File llamado CourseFactory
    
    //3. Nos llevaremos todos los cursos a la CourseFactory
    /*var courses = [
        Course(name: "Swift desde cero", imagen: "swift", description: "Swift es un lenguaje rápido y eficiente que proporciona información en tiempo real y puede incorporarse fácilmente al código de Objective-C existente. Así, los desarrolladores no sólo pueden programar de una forma más segura y confiable, sino también ahorrar tiempo y enriquecer la experiencia con las apps."),
        Course(name: "Python de cero a experto", imagen: "python", destacado: true),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython"),
        Course(name: "Hacking con Python", imagen: "hackPython")
    ]*/
    
    var body: some View {
        NavigationView {
            //5. Arreglamos este error modificando la "List(courses) { course in" por "List(CourseFactory.courses) { course in"
            List(CourseFactory.courses) { course in
                CoursFullImageRow(course: course)
                    .onTapGesture {
                        selectedCourse = course
                    }
            }.sheet(item: $selectedCourse) { course in 
                DetailView(course: course)
            }.navigationTitle("Cursos de Tectroya")
        }
    }
}
//6. Tambien podriamos seleccionar los archivos CourseFactory y Course y con el boton derecho crear un New Group from Selection y llamarlo como Model, de esta manera nos quedara en carpetas
//7. Hacemos lo mismo con la ContentView y el DetailView y lo llamaremos
//8. Por lo tanto ahora nos queda separado tanto la vista como el controlador (modelo) 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CoursRow: View {
    var course : Course
    
    var body: some View {
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

struct CoursFullImageRow: View {
    var course : Course
    
    var body: some View {
        ZStack {
            Image(course.imagen)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                        .opacity(0.25)
                )
            Text(course.name)
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}
