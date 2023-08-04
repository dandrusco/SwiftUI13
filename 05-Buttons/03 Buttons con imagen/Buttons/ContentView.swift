//
//  ContentView.swift
//  Buttons
//
//  Created by Danilo Andrusco on 04-08-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //1. Eliminaremos todos los botenes creados, menos el ultimo (el redondeado) y lo llamaremos Hola Mundo
        
            Button(action: {
                print("Boton Hola Mundo pulsado")
            }) {
                Text("Hola Mundo")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .cornerRadius(50)
                    .padding(12)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.orange, lineWidth: 5))
            }
            //2. Crearemos un nuevo boton redondeado pero con una imagen de un basurero
            Button(action: {
                print("Boton papelera pulsado")
            }){
                Image(systemName:"trash")
                    .padding()
                    .background(Color.red)
                    .clipShape(Circle())//Boton redondeado
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            
            //3. Modificaremos el boton del basurero agregandole texto
            Button(action: {
                print("Boton papelera pulsado")
            }){
                //Meteremos solo la imagen en un HStack
                HStack {
                    Image(systemName:"trash")
                    //Agregamos el texo
                    Text("Eliminar")
                        .fontWeight(.bold)
                }
                //Edentamos a la izquierda
                .padding()
                .background(Color.red)
                //Eliminaremos el clipShape
                /*.clipShape(Circle())*/
                .font(.largeTitle)
                .foregroundColor(.white)
                //Le agregaremos un borde
                .cornerRadius(40)
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
