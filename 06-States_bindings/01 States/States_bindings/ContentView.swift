//
//  ContentView.swift
//  States_bindings
//
//  Created by Danilo Andrusco on 06-08-23.
//


//1. Crearemos un boton de reproduccion donde debera cambiar su forma al ser pulsado
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //2. Crearemos un boton donde su accion sera "Boton play pulsado"
            Button(action: {
                print("Boton play pulsado")
            }) {
                //3. Su apariencia sera de un boton play azul redondeado de tamaño 100
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
