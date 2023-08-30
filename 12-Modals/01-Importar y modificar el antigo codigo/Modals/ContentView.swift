//
//  ContentView.swift
//  Modals
//
//  Created by Danilo Andrusco on 30-08-23.
//

import SwiftUI

struct ContentView: View {
    
    //1 Crearemos un estado no privado para la variable del modal en principio false
    @State var showModalView = false
    
    //2. Crearemos otro estado No privado para ver la seleccion del curso como opcional
    @State var selectedCourse: Course?
    
    var courses = [
        Course(name: "Swift desde cero", imagen: "swift"),
        Course(name: "Python de cero a experto", imagen: "python", destacado: true),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython"),
        Course(name: "Hacking con Python", imagen: "hackPython")
    ]
    
    var body: some View {
        NavigationView {
            //3. Modificaremos la lista ya que no hace falta que recorra los indices
            /*List(courses.indices, id: \.self) { idx in*/
            List(courses) { course in
                
                //4. Vamos a eliminar el NavigationLink ya que utilizaremos los Modals
                /*NavigationLink(destination: DetailView(course: courses[idx])){*/
                
                //5.Para simplificar eliminaremos todo el condicional if y solo nos quedaremos con esta linea de codigo: CoursFullImageRow(course: courses[idx]) pero eliminando el indice quedando asi: CoursFullImageRow(course: course)
                /*if courses[idx].destacado {*/
                CoursFullImageRow(course: course)
                /*}
                else{
                    CoursRow(course: courses[idx])
                }*/
            }
            //6. Crearemos el modificador Sheet que si el valor de showModalView es true mostrara el modal
            .sheet(isPresented: $showModalView){ //Se le debe anteponer el signo dolar ya que es un binding (referencia)
                //7. Si el selectedCourse es diferente de nul, en otras palabras; si hay un curso seleccionado
                if selectedCourse != nil {
                    //8. Invocamos a la DetailView pasandole el curso seleccionado
                    DetailView(course: selectedCourse!)// Con ! le aseguramos que la variable exciste
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
