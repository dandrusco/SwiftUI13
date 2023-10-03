//
//  ContentView.swift
//  ScrollCardView
//
//  Created by Danilo Andrusco on 03-08-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
            
            //1. Copiaremos todo el ScrollView y lo pegaremos mas abajo
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CardView(imageName: "swift", authorName: "Danilo Andrusco", courseTittle: "Swift desde cero", originalPrice: "USD 199.9", discountPrice: "USD 10.99").frame(width: 300)
                    //3. Eliminaremos los cursos de Python
                    /*CardView(imageName: "python", authorName: "Danilo Andrusco", courseTittle: "Python de cero a Experto", originalPrice: "USD 199.9", discountPrice: "USD 14.99").frame(width: 300)
                    CardView(imageName: "interfazPython", authorName: "Danilo Andrusco", courseTittle: "Interfaz grafica en Python", originalPrice: "USD 199.9", discountPrice: "USD 9.99").frame(width: 300)
                    CardView(imageName: "hackPython", authorName: "Danilo Andrusco", courseTittle: "Hacking con Python", originalPrice: "USD 199.9", discountPrice: "USD 21.99").frame(width: 300)*/
                }
                Spacer()
            }
            //2. Lo pegamos aqui
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    //4. Eliminaremos el curso de Swift
                    /*CardView(imageName: "swift", authorName: "Danilo Andrusco", courseTittle: "Swift desde cero", originalPrice: "USD 199.9", discountPrice: "USD 10.99").frame(width: 300)*/
                    CardView(imageName: "python", authorName: "Danilo Andrusco", courseTittle: "Python de cero a Experto", originalPrice: "USD 199.9", discountPrice: "USD 14.99").frame(width: 300)
                    CardView(imageName: "interfazPython", authorName: "Danilo Andrusco", courseTittle: "Interfaz grafica en Python", originalPrice: "USD 199.9", discountPrice: "USD 9.99").frame(width: 300)
                    CardView(imageName: "hackPython", authorName: "Danilo Andrusco", courseTittle: "Hacking con Python", originalPrice: "USD 199.9", discountPrice: "USD 21.99").frame(width: 300)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
