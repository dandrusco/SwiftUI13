//
//  ContentView.swift
//  Buttons
//
//  Created by Danilo Andrusco on 04-08-23.
//


//1. Podemos ver si el usuario preciono o no el boton:

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("Boton editar pulsado")
            }){
                HStack {
                    Image(systemName:"square.and.pencil")
                    Text("Editar")
                        .fontWeight(.bold)
                }
            }.buttonStyle(EstiloDeBotones())
            
            Button(action: {
                print("Boton papelera pulsado")
            }){
                HStack {
                    Image(systemName:"trash")
                    Text("Eliminar")
                        .fontWeight(.bold)
                }
            }.buttonStyle(EstiloDeBotones())
            
            Button(action: {
                print("Boton compartir pulsado")
            }){
                HStack {
                    Image(systemName:"square.and.arrow.up")
                    Text("Compartir")
                        .fontWeight(.bold)
                }
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
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(LinearGradient(colors: [Color("Dark Ocean"), Color("Dark Ocean 2")], startPoint: .top, endPoint: .bottom))
            .font(.largeTitle)
            .foregroundColor(.white)
            .cornerRadius(40)
            .shadow(color: .blue, radius: 10.0)
            .padding(.horizontal, 20)
            //2. Cuando se pulse el boton, el boton se achicara al 80% y de lo contraro estara al 100%
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}
