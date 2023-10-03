//
//  ContentView.swift
//  Forms
//
//  Created by Danilo Andrusco on 04-09-23.
//

import SwiftUI

struct ContentView: View {
    
    @State var courses = [
        Course(name: "Swift desde cero", imagen: "swift", type: "Swift", priceLevel: 3, purchased: true),
        Course(name: "Python de cero a experto", imagen: "python", type: "Python", priceLevel: 4, destacado: true),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython", type: "Python", priceLevel: 2),
        Course(name: "Hacking con Python", imagen: "hackPython", type: "Python", priceLevel: 5, destacado: true, purchased: true)
    ]
    //4. Ahora deberemos decirle a nuestra inferfaz que debe repintarse segun la opcion que marquemos para ello crearemos una variable opcional
    @State var selectedCourse: Course?
    
    var body: some View {
        NavigationView {
            //1. Cambiaremos la lista para tomar los datos por los cursos y no por sus indices
            /*List(courses.indices, id: \.self) { idx in*/
            List(courses) { course in
                ZStack{
                    //2. En la CoursRow eliminaremos el courses[idx] por course e invocaremos el menu contextual con su boton para las 3 funciones creadas anteriormente
                    CoursRow(course: course)
                        .contextMenu{
                            Button(action: {
                                setPurchased(item: course)
                            }) {
                                HStack{
                                    Text("Comprar")
                                    Image(systemName: "checkmark.circle")
                                }
                            }
                            
                            Button(action: {
                                setFeature(item: course)
                            }) {
                                HStack{
                                    Text("Destacar")
                                    Image(systemName: "star")
                                }
                            }
                            
                            Button(action: {
                                delete(item: course)
                            }) {
                                HStack{
                                    Text("Eliminar")
                                    Image(systemName: "trash")
                                }
                            }
                        }//5. Nos quedaremos con el curso seleccionado
                        .onTapGesture {
                            selectedCourse = course
                        }
                    
                    //2. En la NavigationLink eliminaremos el courses[idx] por course
                    NavigationLink(destination: DetailView(course: course)){
                        EmptyView()
                    }.opacity(0)
                }
            }.navigationTitle("Cursos de Tectroya")
        }
    }
    
    private func setFeature(item course: Course){
        if let idx = courses.firstIndex(where: {$0.id == course.id}){
            courses[idx].destacado.toggle()
        }
    }

    private func setPurchased(item course: Course){
        if let idx = courses.firstIndex(where: {$0.id == course.id}){
            courses[idx].purchased.toggle()
        }
    }

    private func delete(item course: Course){
        if let idx = courses.firstIndex(where: {$0.id == course.id}){
            courses.remove(at: idx)
        }
    }
    
}

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
                .clipShape(Circle())
                .padding(.trailing, 10)
            
            VStack (alignment: .leading){
                HStack {
                    Text(course.name)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Text(String(repeating: "$", count: course.priceLevel))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Text(course.type)
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundColor(.secondary)
            }
            Spacer().layoutPriority(-10)
            
            if course.destacado {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            if course.purchased {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
    }
}
