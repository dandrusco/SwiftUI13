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
                //6. En vez de utilizar el .clipped() y el .cornerRadius(30) podemos agregar un clipShape
                /*.clipped()
                .cornerRadius(30)*/
                .clipShape(Circle())
                //7. Agregaremos un pading a la imagen
                .padding(.trailing, 10)
            
            //1. Meteremos el curso en una VStack alineado a la izquierda
            VStack (alignment: .leading){
                //2. Crearemos una HStack tanto para el nombre como para el precio del curso
                HStack {
                    Text(course.name)
                    //3. Ya no necesitaremos el frame
                    /*.frame(width: 250)*/
                    //4. Cambiaremos el formato de letras
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    //5. Agregaremos el $
                    Text(String(repeating: "$", count: course.priceLevel))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                //8. Pondremos el tipo del curso
                Text(course.type)
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundColor(.secondary)
            }
            //9. Ahora alinearemmos todo a la izquierda con Spacer dandole una prioridad muy baja por si nos quedamos corto
            Spacer().layoutPriority(-10)
            
            //10. Le pondremos una estrella amarilla si el curso esta destacado
            if course.destacado {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            //11. Le pondremos un checkmark si el curso esta comprado
            if course.purchased {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
    }
}
