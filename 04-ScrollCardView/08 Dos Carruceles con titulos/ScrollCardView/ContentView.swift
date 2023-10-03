//
//  ContentView.swift
//  ScrollCardView
//
//  Created by Danilo Andrusco on 03-08-23.
//

//1. Le agregaremos los titulos

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
            Text("Desde el 2009 enseñando en Youtube")
                .fontWeight(.light)
                .foregroundColor(.secondary)
            Text("3.600 alumnos - 7 Cursos")
                .font(.system(.footnote, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.secondary)
            
            //2. Pondremos el primer titulo de Swfit:
            Text("Cursos de Swift:")
                .font(.system(.title, design: .rounded))
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CardView(imageName: "swift", authorName: "Danilo Andrusco", courseTittle: "Swift desde cero", originalPrice: "USD 199.9", discountPrice: "USD 10.99").frame(width: 300)
                }
                Spacer()
            }
            
            //3. Pondremos el segundo titulo de Python:
            Text("Cursos de Python:")
                .font(.system(.title, design: .rounded))
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .padding(.top)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
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
