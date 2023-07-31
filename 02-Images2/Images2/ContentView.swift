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
            //Image("fondoNuevo").resizable() //Pone una imagen en una zona segura
            
            //Image("fondoNuevo").scaledToFit()//Hace que la imagen no pierda zona de la imagen
            
            Image("fondoNuevo").imageScale(.large).foregroundColor(.accentColor)//Forma actual de agregar imagen por defecto
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
