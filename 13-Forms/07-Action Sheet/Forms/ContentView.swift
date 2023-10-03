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

    @State private var showActionSheet = false
    //2. Creamos una variable de estado
    @State private var navigateToAnotherView = false
    @State private var selectedCourse: Course?

    var body: some View {
        NavigationView {
            List{
                ForEach(courses) { course in
                    ZStack{
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
                            }
                            .onTapGesture {
                                showActionSheet.toggle()
                                selectedCourse = course
                            }
                            .actionSheet(isPresented: $showActionSheet){
                                ActionSheet(title: Text("Indica tu accion a realizar"),
                                            buttons: [
                                                //1. Generaremos un nuevo boton para ver el detalle del curso
                                                .default(Text("Ver detalle del curso")) {
                                                    //3. La cambiamos a verdadero
                                                    navigateToAnotherView = true
                                                },
                                                .default(Text("Marcar como favorito"), action: {
                                                                if let selectedCourse =
                                                                    selectedCourse {
                                                                    setFeature(item: selectedCourse)
                                                                }
                                                            }),
                                                .default(Text("Comprar curso"), action: {
                                                                if let selectedCourse =
                                                                    selectedCourse {
                                                                    setPurchased(item: selectedCourse)
                                                                }
                                                            }),
                                                .destructive(Text("Eliminar Curso"), action: {
                                                                if let selectedCourse =
                                                                    selectedCourse {
                                                                    delete(item: selectedCourse)
                                                                }
                                                            }),
                                                .cancel()
                                                ])
                            }
                        //4. Arrancamos la Navigation en caso de ser verdadero
                        NavigationLink(destination: DetailView(course: course), isActive: $navigateToAnotherView){
                            EmptyView()
                        }.opacity(0)
                    }
                }.onDelete{ (indexSet) in
                    courses.remove(atOffsets: indexSet)
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
