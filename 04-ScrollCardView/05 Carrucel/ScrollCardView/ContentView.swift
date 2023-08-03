//
//  ContentView.swift
//  ScrollCardView
//
//  Created by Danilo Andrusco on 03-08-23.
//

//1. Cambiaremos el codigo para que pase de tener el Scroll a un Carrusel

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //2. Al propio ScrollView le abrimos un parentesis y le agregamos el .Horizontal, tambien le pondremos este parametro showsIndicators como false, si queremos ocultar la barra del Scroll
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Image("udemy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                Text("Tectroya")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("Dessde 2009 enseñando en Youtube")
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                Text("3.600 alumnos - 7 Cursos")
                    .font(.system(.footnote, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(.secondary)
            }
            
            //3. Vidualmente no se ve bien por lo tanto todos los cursos deberemos meterlos dentro de una HStack
            HStack {
                //4. deberemos limitar su anchura
                CardView(imageName: "swift", authorName: "Danilo Andrusco", courseTittle: "Swift desde cero", originalPrice: "USD 199.9", discountPrice: "USD 10.99").frame(width: 300)
                CardView(imageName: "python", authorName: "Danilo Andrusco", courseTittle: "Python de cero a Experto", originalPrice: "USD 199.9", discountPrice: "USD 14.99").frame(width: 300)
                CardView(imageName: "interfazPython", authorName: "Danilo Andrusco", courseTittle: "Interfaz grafica en Python", originalPrice: "USD 199.9", discountPrice: "USD 9.99").frame(width: 300)
                CardView(imageName: "hackPython", authorName: "Danilo Andrusco", courseTittle: "Hacking con Python", originalPrice: "USD 199.9", discountPrice: "USD 21.99").frame(width: 300)
            }
            //5. Tiraremos todo el codigo hacia arriba
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
