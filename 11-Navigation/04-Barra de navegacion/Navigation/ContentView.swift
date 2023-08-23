//
//  ContentView.swift
//  Navigation
//
//  Created by Danilo Andrusco on 23-08-23.
//

import SwiftUI

struct ContentView: View {
    
    var courses = [
        Course(name: "Swift desde cero", imagen: "swift"),
        Course(name: "Python de cero a experto", imagen: "python", destacado: true),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython"),
        Course(name: "Hacking con Python", imagen: "hackPython")
    ]
    
    var body: some View {
        NavigationView {
            List(courses.indices, id: \.self) { idx in
                NavigationLink(destination: DetailView(course: courses[idx])){
                    if courses[idx].destacado {
                        CoursFullImageRow(course: courses[idx])
                    }
                    else{
                        CoursRow(course: courses[idx])
                    }
                }
            }
            //1. A modo de ejemplo cambiaremos el tuulo de "Cursos de Tectroya" por "Cursos de www.Tectroya.cl"
            //2. Como podemos apreciar ahora el titulo se corta
            //3. Se hacemos Scroll hacia arriba vemos que el titulo se achica y si aparece completo
            //4. Para poder solucionar esto, deberemos agregar otro parametro llamado .navigationBarTitleDisplayMode como ..inline
            /*.navigationTitle("Cursos de www.Tectroya.cl").navigationBarTitleDisplayMode(.inline)*/
            //5.Volvemos a como estaba en el punto uno
            .navigationTitle("Cursos de Tectroya")
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
