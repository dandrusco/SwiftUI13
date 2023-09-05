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
    
    var body: some View {
        NavigationView {
            List(courses.indices, id: \.self) { idx in
                ZStack{
                    CoursRow(course: courses[idx])
    
                    NavigationLink(destination: DetailView(course: courses[idx])){
                        EmptyView()
                    }.opacity(0)
                }
            }.navigationTitle("Cursos de Tectroya")
        }
    }
    //1. Crearemos una funcion para destacar los Cursos
    private func setFeature(item course: Course){
        //2. Nos quedaremos con la primera posicion donde el curso en el cual estoy iterando coincida con el curso que es llegado por parametro
        if let idx = courses.firstIndex(where: {$0.id == course.id}){
            //3. Si lo encuentro creamos un togle para cambiar de true a false y viceversa
            courses[idx].destacado.toggle()
        }
    }
    //4. Crearemos una funcion para comprar Cursos con la misma logica de la funcion anterior
    private func setPurchased(item course: Course){
        if let idx = courses.firstIndex(where: {$0.id == course.id}){
            courses[idx].purchased.toggle()
        }
    }
    //5. Crearemos una funcion para borrar
    private func delete(item course: Course){
        //6. Localizamos la ubicacion
        if let idx = courses.firstIndex(where: {$0.id == course.id}){
            //7. Lo eliminamos
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
