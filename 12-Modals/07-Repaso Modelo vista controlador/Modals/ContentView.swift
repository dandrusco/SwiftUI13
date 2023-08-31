//
//  ContentView.swift
//  Modals
//
//  Created by Danilo Andrusco on 30-08-23.
//

//1. Hasta el momento tenemos tanto la vista como los controladores en el mismo fichero llamado ContentView, para ello vamos a crear un nuevo fichero llamado Course de tipo Swift File
import SwiftUI

struct ContentView: View {
    
    @State var selectedCourse: Course?
    
    var courses = [
        //4. Le agregaremos una descripcion solo al primer curso a modo de prueba
        Course(name: "Swift desde cero", imagen: "swift", description: "Swift es un lenguaje rápido y eficiente que proporciona información en tiempo real y puede incorporarse fácilmente al código de Objective-C existente. Así, los desarrolladores no sólo pueden programar de una forma más segura y confiable, sino también ahorrar tiempo y enriquecer la experiencia con las apps."),
        Course(name: "Python de cero a experto", imagen: "python", destacado: true),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython"),
        Course(name: "Hacking con Python", imagen: "hackPython")
    ]
    
    var body: some View {
        NavigationView {
            List(courses) { course in
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//2. Cortaremos este codigo y lo pegaremos en el course
/*struct Course : Identifiable {
    var id = UUID()
    var name : String
    var imagen : String
    var destacado : Bool = false
}*/

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
