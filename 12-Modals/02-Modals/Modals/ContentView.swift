//
//  ContentView.swift
//  Modals
//
//  Created by Danilo Andrusco on 30-08-23.
//

import SwiftUI

struct ContentView: View {
    
    @State var showModalView = false
    @State var selectedCourse: Course?
    
    var courses = [
        Course(name: "Swift desde cero", imagen: "swift"),
        Course(name: "Python de cero a experto", imagen: "python", destacado: true),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython"),
        Course(name: "Hacking con Python", imagen: "hackPython")
    ]
    
    var body: some View {
        NavigationView {
            List(courses) { course in
                CoursFullImageRow(course: course)
                //1. Hasta el momento si hacemos clic en cualquier imagen aun no le hemos sicho que capture esos gestos, para ello utilizamos .onTapGesture
                    .onTapGesture {
                        //2. Si alguien toca, deberemos cambiar el valor de showModalView a true
                        showModalView = true
                        //3. Y le deberemos indicar cual curso mostrar
                        selectedCourse = course
                    }
            }.sheet(isPresented: $showModalView){
                if selectedCourse != nil {
                    DetailView(course: selectedCourse!)
                }
            }.navigationTitle("Cursos de Tectroya")
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
    var destacado : Bool = false
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
