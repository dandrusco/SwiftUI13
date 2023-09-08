//
//  ContentView.swift
//  Forms
//
//  Created by Danilo Andrusco on 04-09-23.
//


//1. Si deslizamos de derecha a izquiera nos aparece la opcion de eliminar pero en ingles DETETE
//2. Para poder cambiarlo deberemos hacerle clic al archivo principal de color azul llamada Forms
//3. En el menú izquiero aparece aparece PROYECT y TARGET, deberemos seleccionar el Form del PROYECT
//4. En el menú del medio dice: Info, Build Settings y Package Dependencies. Seleccionamos Info
//5. En el apartado de Localizations deberemos darle en el signo + y buscamos Spanish
//6. Si hacemos clic en Spanish se muestra una opcion que dice Set Default, al seleccionarlo le aparecera un ticket a Spanish quedando el idioma por defecto
//7. Ahora podemos comprabar que pasamos de DELETE a ELIMINAR
import SwiftUI

struct ContentView: View {
    
    @State var courses = [
        Course(name: "Swift desde cero", imagen: "swift", type: "Swift", priceLevel: 3, purchased: true),
        Course(name: "Python de cero a experto", imagen: "python", type: "Python", priceLevel: 4, destacado: true),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython", type: "Python", priceLevel: 2),
        Course(name: "Hacking con Python", imagen: "hackPython", type: "Python", priceLevel: 5, destacado: true, purchased: true)
    ]

    @State private var showActionSheet = false
    @State private var selectedCourse: Course?
    @State private var showSettingsView: Bool = false
    
    var settings : SettingsFactory

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
                        /*NavigationLink(destination: DetailView(course: course)){
                            EmptyView()
                        }.opacity(0)*/
                    }
                }.onDelete{ (indexSet) in
                    courses.remove(atOffsets: indexSet)
                }
                
            }
            .navigationTitle("Cursos de Tectroya")
            .navigationBarItems(trailing:
                Button(action: {
                    showSettingsView = true
            }) {
                Image(systemName: "line.horizontal.3.decrease.circle")
                    .font(.title)
                    .foregroundColor(.gray)
            })
            .sheet(isPresented: $showSettingsView){
                SettingsView(settings: settings)
            }
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
        ContentView(settings: SettingsFactory())
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
