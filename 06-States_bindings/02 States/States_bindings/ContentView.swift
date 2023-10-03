//
//  ContentView.swift
//  States_bindings
//
//  Created by Danilo Andrusco on 06-08-23.
//


import SwiftUI

struct ContentView: View {
    //1. Declararemos una variable privada que nos pregunte si esta reproduciendo musica, inicialmente estara detenida
    private var isPlaying = false
    
    var body: some View {
        VStack {
            Button(action: {
                print("Boton play pulsado")
            }) {
                //2. Cambiaremos esla linea por una boleana para ver si cambia o no el nombre del icono
                /*Image(systemName: "play.circle.fill")*/
                Image(systemName:isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .font(.system(size: 100))
                //3. Cambiaremos el color dependiendo del boton
                    /*.foregroundColor(.blue)*/
                    .foregroundColor(isPlaying ? .red : .blue)
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
