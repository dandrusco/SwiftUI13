//
//  DetailView.swift
//  Navigation
//
//  Created by Danilo Andrusco on 23-08-23.
//

import SwiftUI

struct DetailView: View {
    //2. crearemos la variable course
    var course: Course
    
    var body: some View {
        //4. Borramos el Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        /*Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)*/
        //5. Creamos el entorno del curso con una VStack
        VStack {
            //6. Agregamos la imagen
            Image(course.imagen)
                .resizable()//La redimencionamos
                .aspectRatio(contentMode: .fit)//Que se adapte
            
            //7. Agregamos el tirulo por debajo
            Text(course.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)//Negrita
                .frame(width: 300)//Le damos altura de 300
                .lineLimit(2)//Indicamos que el titulo tenga solo 2 lineas
            
            //8. mandamos imagen y texto a la parte superior de la pantalla
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        //3. Automaticamente nos dara eerror ya que deberemos indicar un curso para que pueda generar la vista
        DetailView(course: Course(name: "Swift desde cero", imagen: "swift"))
    }
}
