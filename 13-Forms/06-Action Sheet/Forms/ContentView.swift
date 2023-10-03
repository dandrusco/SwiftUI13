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

    //1. Una alternativa al Menu contextual es la ActionSheet, para ello deveremos crear otra variable de estado
    @State private var showActionSheet = false
    //2. pasaremos este estado a privado
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
                                //3. En caso de ser tocada pasaremos el showActionSheet a verdadero
                                showActionSheet.toggle()
                                selectedCourse = course
                            }
                            //4. Lanzaremos el modificador ActionSheet con el enfoque booleano $showActionSheet
                            .actionSheet(isPresented: $showActionSheet){
                                //5. Le agregaremos el titulo
                                ActionSheet(title: Text("Indica tu accion a realizar"),
                                            //6. Crearemos un Arrays de botones
                                            buttons: [
                                                //6. Creamos el primer boton por defecto para favorito
                                                .default(Text("Marcar como favorito"), action: {
                                                                //7. Si lo tocamos como favorito seleccionamos el curso y se lo pasamos a la funcion de setFeature
                                                                if let selectedCourse =
                                                                    selectedCourse {
                                                                    setFeature(item: selectedCourse)
                                                                }
                                                            }),
                                                //8. Creamos el primer boton por defecto para favorito
                                                .default(Text("Comprar curso"), action: {
                                                                if let selectedCourse =
                                                                    selectedCourse {
                                                                    setPurchased(item: selectedCourse)
                                                                }
                                                            }),
                                                //9. Crearemos otr boton para eliminar el curso
                                                .destructive(Text("Eliminar Curso"), action: {
                                                                if let selectedCourse =
                                                                    selectedCourse {
                                                                    delete(item: selectedCourse)
                                                                }
                                                            }),
                                                //10. Boton cancelar para eliminar la AcctionSheet
                                                .cancel()
                                                ])
                            }
                        /*NavigationLink(destination: DetailView(course: course)){
                            EmptyView()
                        }.opacity(0)*/
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
