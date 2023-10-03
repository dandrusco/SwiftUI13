//
//  ContentView.swift
//  Images2
//
//  Created by Danilo Andrusco on 30-07-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //Image("fondoNuevo").imageScale(.large).foregroundColor(.accentColor)//Forma actual de agregar imagen por defecto
            
            //Image("fondoNuevo").resizable() //Pone una imagen en una zona segura
            
            //Image("fondoNuevo").scaledToFit()//Hace que la imagen no pierda zona de la imagen
            
            //Image("fondoNuevo").resizable().clipShape(Circle())//Crea la imagen circular
            
            Image("fondoNuevo")
                .resizable()
                .clipShape(Circle())
                .opacity(0.8)//Modifica la opacidad
                .overlay(Image(systemName: "heart.fill")
                    .font(.system(size: 120))
                    .foregroundColor(.pink))//Overay es como otra vista
                .overlay(Text("SwiftUI")
                    .fontWeight(.bold))
            //Podemos oscurecer la imagen con sus capas (overlay)
                .overlay(Circle()
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .overlay(Text("Tectroya")
                        .font(.title)
                        .fontWeight(.bold),alignment: .top))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
