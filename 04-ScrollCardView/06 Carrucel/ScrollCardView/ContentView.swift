//
//  ContentView.swift
//  ScrollCardView
//
//  Created by Danilo Andrusco on 03-08-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //1.- Para que el titulo no quede Scroleable nos llevaremos esta linea  ScrollView(.horizontal, showsIndicators: false) y se la pegaremos encima del HStack
        //2. Ojo con la identacion del VStack ya que deberemos retroceder un espacio
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
        //3. Cortaremos este cierre y lo pegaremos más abajo
        
            ScrollView(.horizontal, showsIndicators: false) {
                //4. Identamos mas adentro
                HStack {
                    CardView(imageName: "swift", authorName: "Danilo Andrusco", courseTittle: "Swift desde cero", originalPrice: "USD 199.9", discountPrice: "USD 10.99").frame(width: 300)
                    CardView(imageName: "python", authorName: "Danilo Andrusco", courseTittle: "Python de cero a Experto", originalPrice: "USD 199.9", discountPrice: "USD 14.99").frame(width: 300)
                    CardView(imageName: "interfazPython", authorName: "Danilo Andrusco", courseTittle: "Interfaz grafica en Python", originalPrice: "USD 199.9", discountPrice: "USD 9.99").frame(width: 300)
                    CardView(imageName: "hackPython", authorName: "Danilo Andrusco", courseTittle: "Hacking con Python", originalPrice: "USD 199.9", discountPrice: "USD 21.99").frame(width: 300)
                }
                Spacer()
            }
            //3.1 Lo pegamos aca }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
