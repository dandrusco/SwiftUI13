//
//  ContentView.swift
//  P1-ExpandableButtonSheet
//
//  Created by Danilo Andrusco on 10-10-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //6. Crearemos el arrays de cursos
        NavigationView{
            List{
                ForEach(courses){ course in
                    BasicRow(course: course)
                }
            }
            .navigationBarTitle("Cursos Online")
        }
    }
}

#Preview {
    ContentView()
}

//5. Crearemos la estructura para las celdas
struct BasicRow: View {
    var course: Course
    
    var body: some View{
        HStack{
            Image(course.imagen)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            Text(course.name)
        }
    }
}
