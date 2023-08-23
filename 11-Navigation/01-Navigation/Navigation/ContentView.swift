//
//  ContentView.swift
//  Navigation
//
//  Created by Danilo Andrusco on 23-08-23.
//

//1. Copiaremos el mismo codigo fuente del ultimo proyecto 10-list/13-Celdas combinadas
//2. Como podemos apreciar nos faltan las imagenes, para ello copiaremos todos los archivos y carpetas que estan dentro de 10-list/13-Celdas combinadas/list/Assets.xcassets y lo pegaremos en la misma carpeta Assets.xcassets pero de este proyecto
import SwiftUI

struct ContentView: View {
    
    var courses = [
        Course(name: "Swift desde cero", imagen: "swift"),
        Course(name: "Python de cero a experto", imagen: "python", destacado: true),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython"),
        Course(name: "Hacking con Python", imagen: "hackPython")
    ]
    
    var body: some View {
        //3. Para que nuestra lista tenga la opcion de poder entrar en una de ellas (navegable), tendremos que crear una NavigationView que abarque la lista
        NavigationView {
            List(courses.indices, id: \.self) { idx in
                if courses[idx].destacado {
                    CoursFullImageRow(course: courses[idx])
                }
                else{
                    CoursRow(course: courses[idx])
                }
            } //4. Para agregarle un titulo a la lista, se debe asignar al cierre de la lista
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
