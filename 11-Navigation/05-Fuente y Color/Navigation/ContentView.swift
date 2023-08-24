//
//  ContentView.swift
//  Navigation
//
//  Created by Danilo Andrusco on 23-08-23.
//


//1. Si quisieramos configurar la fuente y el color del navigationTitle deberemos crear un constructor
import SwiftUI

struct ContentView: View {
    
    var courses = [
        Course(name: "Swift desde cero", imagen: "swift"),
        Course(name: "Python de cero a experto", imagen: "python", destacado: true),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython"),
        Course(name: "Hacking con Python", imagen: "hackPython")
    ]
    //2. Creamos el constructor a continuacion pero con codigo de Swift con UIKit, no de SwiftUI, por lo tanto se debe realizar fuera del Body:
    init() {
        //3. Modificaremos el titulo grande de la navigationTitle
        let apareance = UINavigationBarAppearance()
        apareance.largeTitleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 32)!, //Deberemos ponerle una exclamacion por que la fuente es opcional
            .foregroundColor : UIColor.systemOrange
        ]
        //4. Tambien podemos modificar el que se hace pequeño con el scroll
        apareance.titleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 18)!,
            .foregroundColor : UIColor.systemOrange
        ]
        //5. Una ves configurada la apariencia, se la pasaremos a la vista standar, compactada y scroleable
        UINavigationBar.appearance().standardAppearance = apareance
        UINavigationBar.appearance().compactAppearance = apareance
        UINavigationBar.appearance().scrollEdgeAppearance = apareance
    }
    
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
