//
//  ContentView.swift
//  list
//
//  Created by Danilo Andrusco on 21-08-23.
//

import SwiftUI

struct ContentView: View {
    
    var courses = [
        Course(name: "Swift desde cero", imagen: "swift"),
        Course(name: "Python de cero a experto", imagen: "python"),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython"),
        Course(name: "Hacking con Python", imagen: "hackPython")
    ]
    
    var body: some View {
        //2. Por lo tanto ahora podemos eliminar todo el id pasando de esto:
        /*List(courses, id: \.id) { course in*/
        //3. A esto:
        List(courses) { course in
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//1. Podemos simplificar aun mas esto, indicandole ahora que Course es identificable ua que tiene una varieble ID con indicadores unicos
struct Course : Identifiable {
    var id = UUID()
    var name : String
    var imagen : String
}
