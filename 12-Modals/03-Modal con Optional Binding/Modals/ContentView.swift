//
//  ContentView.swift
//  Modals
//
//  Created by Danilo Andrusco on 30-08-23.
//

import SwiftUI

struct ContentView: View {
    
    //1. Como vimos en el codigo anterior, creamos el showModalView para mostrar o no el modal, podemos impresindir de esta variable con el Optional Binding
    /*@State var showModalView = false*/
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
                    .onTapGesture {
                        //5. Esta variable esta de mas, asi quie la eliminamo
                        /*showModalView = true*/
                        selectedCourse = course
                    }
            }
            //2. Cambiaremos esta linea de codigo
            /*.sheet(isPresented: $showModalView){
                if selectedCourse != nil {
                    DetailView(course: selectedCourse!)
                }*/
            //3. En el items, le pasaremos el valor del items que queremos mostrar, en nuestro caso $selectedCourse (dolar por el bindning)
            .sheet(item: $selectedCourse) { course in //4. Por lo tanto si se detecta que no es nulo, se lo pasamos a course
                //4. ahora con este course podemos invocar a la DetailView
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
