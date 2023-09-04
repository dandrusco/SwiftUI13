//
//  ContentView.swift
//  Forms
//
//  Created by Danilo Andrusco on 04-09-23.
//

//1. Tomaremos la app numero 11
//2. Copiaremos el ContentView y lo remplazaremos por este
//3. Nos traremos el DatailView y Assets.xcassets de la app 11
//4. Crearmeos un nuevo fichero de SwiftUI File y lo llamaremos Course
import SwiftUI

struct ContentView: View {
    
    //18. Convertiremos la variable course en un State para conocer el estado de ellos en todo momento
    @State var courses = [
        //15. Le agregaremos las nuevas variables al constructor
        Course(name: "Swift desde cero", imagen: "swift", type: "Swift", priceLevel: 3),
        Course(name: "Python de cero a experto", imagen: "python", type: "Python", priceLevel: 4, destacado: true),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython", type: "Python", priceLevel: 2),
        Course(name: "Hacking con Python", imagen: "hackPython", type: "Python", priceLevel: 5, purchased: true)
    ]
    
    var body: some View {
        NavigationView {
            List(courses.indices, id: \.self) { idx in
                //11. Crearemos un ZStack y meteremos dentro el NavigationLink
                ZStack{
                    //12. Pegaremos la CoursRow(course: courses[idx])
                    CoursRow(course: courses[idx])
    
                    NavigationLink(destination: DetailView(course: courses[idx])){
                        //10. Ya que eliminamos el CoursFullImageRow, este IF esta demas asi que lo eliminaremos por completp
                        /*if courses[idx].destacado {
                         CoursFullImageRow(course: courses[idx])
                         }
                         else{
                         CoursRow(course: courses[idx])
                         }*/
                        
                        //13. Crearemos una vista vacia
                        EmptyView()
                    }
                    //14. Le ponderemos una opacidad en 0
                    .opacity(0)
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

//5. Nos llevaremos este codigo a Course
/*struct Course : Identifiable {
    var id = UUID()
    var name : String
    var imagen : String
    var destacado : Bool = false
}*/

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
            //17. Centraremos el texto con un frame de 250 para que no queden las fotos corridas
                .frame(width: 250)
        }
    }
}

//9. Eliminaremos todo este CoursFullImageRow ya que no lo utilizaremos
/*struct CoursFullImageRow: View {
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
}*/
