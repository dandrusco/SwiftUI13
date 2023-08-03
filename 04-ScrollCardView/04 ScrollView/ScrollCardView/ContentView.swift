//
//  ContentView.swift
//  ScrollCardView
//
//  Created by Danilo Andrusco on 03-08-23.
//

//1. Ya que tenemos nuestra CardView lista es hora de ponerla en el ContenView, una alternativa seria pegar 4 veces este codigo dentro del VStack:

/*
 CardView(imageName: "swift", authorName: "Danilo Andrusco", courseTittle: "Swift desde cero", originalPrice: "USD 199.9", discountPrice: "USD 10.99")
 */

//2. Esto no va a funcionar ya que una Stack no permite Screllear (no podriamos bajar ni subir)

import SwiftUI

struct ContentView: View {
    var body: some View {
        //3. Eliminaremos el VSrack con todo lo que tiene en su interior incluyendo el padding()
        /*VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()*/
        //Crearemos un Scrollview
        ScrollView {
            //4. Comenzaremos a crear la cabecera dentro de un VStack
            VStack {
                //5. En la carpeta recursos esta la imagen Udemy, la tiraremos al Assts en el apartado de 3x y la llamaremos desde aquí
                Image("udemy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.padding(-40)//Con paging negativo acercamos mas la imagen, pero le estamos quitando margen a los datos vecinos.
                    //Otra forma seria adaptar la imagen (transformar)
                    .frame(height: 50)
                //6. LLenaremos los datos de texto
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
            }
            
            //5. Pegaremos 4 veces el mismo codigo para luego modificarlo segun corresponda
            CardView(imageName: "swift", authorName: "Danilo Andrusco", courseTittle: "Swift desde cero", originalPrice: "USD 199.9", discountPrice: "USD 10.99")
            CardView(imageName: "python", authorName: "Danilo Andrusco", courseTittle: "Python de cero a Experto", originalPrice: "USD 199.9", discountPrice: "USD 14.99")
            CardView(imageName: "interfazPython", authorName: "Danilo Andrusco", courseTittle: "Interfaz grafica en Python", originalPrice: "USD 199.9", discountPrice: "USD 9.99")
            CardView(imageName: "hackPython", authorName: "Danilo Andrusco", courseTittle: "Hacking con Python", originalPrice: "USD 199.9", discountPrice: "USD 21.99")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
