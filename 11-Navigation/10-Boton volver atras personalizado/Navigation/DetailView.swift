//
//  DetailView.swift
//  Navigation
//
//  Created by Danilo Andrusco on 23-08-23.
//

import SwiftUI

struct DetailView: View {
    
    var course: Course
    
    var body: some View {
        //8. Si pensaramos que a futuro esta pantalla tendra mucha informacion, lo logico es que la creemos scroleable
        ScrollView {
            VStack {
                Image(course.imagen)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(course.name)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .lineLimit(2)
                
                Spacer()
            }
        }
        //9. Si ahora nos vamos a la ContentView y entramos en un curso vemos que ahora si es scroleable y que aparece la barra
        
        
        //1. Primero eliminando esta linea ya que no queremos titulo
        /*.navigationBarTitle("", displayMode: .inline)*/
        //2. podemos ignorar el espacio en blanco que hay sobre la imagen con:
            .edgesIgnoringSafeArea(.top)
        //3. Si ahora nos vamos a la ContentView y entramos en un curso vemos que la imagen esta arriba pero se corta con el boton de volver a los cursos
        //4. para evitar ese error deberemos ocultar el boton
            .navigationBarBackButtonHidden(true)
        //5. Si ahora nos vamos a la ContentView y entramos en un curso vemos que se ha ocultado pero ahora no podemos ir atras
        //6. deberemos crear el boton de volver atras
            .navigationBarItems(leading:
            Button(action: {
                //Navegar a la pantalla
            }, label: {
                Image(systemName: "arrow.left.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
            })
            )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: Course(name: "Swift desde cero", imagen: "swift"))
    }
}
