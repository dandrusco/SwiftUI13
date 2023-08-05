//
//  ContentView.swift
//  Buttons
//
//  Created by Danilo Andrusco on 04-08-23.
//


//1. Crearemos un boton que al ser pulsado este se gire en 90°

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //2. Tomaremos el boton de la papelera roja circular
            Button(action: {
                print("Boton papelera pulsado")
            }){
                Image(systemName:"trash")
                //3. Pegaremos sus modificadores en el EstiloDeBotones()
            }.buttonStyle(EstiloDeBotones())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct EstiloDeBotones: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.red)
            .clipShape(Circle())
            .font(.largeTitle)
            .foregroundColor(.white)
            //4. Le daremos una rotacion de 90° al pulsar el boton
            .rotationEffect(configuration.isPressed ? Angle(radians: 1.5708)  : Angle(radians: 0))
    }
}
