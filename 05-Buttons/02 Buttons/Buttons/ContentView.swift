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
            //1. Si queremos trabajar sobre el Boton deberemos invertirlo para poder modificarlo, pasadno de esto:
            
            /*Button("Hola Mundo") {
                print("Boton Hola Mundo pulsado")
            }*/
            
            //1.1 a Esto:
            Button(action: {
                //Que debe hacer el boton
                print("Boton Hola Mundo pulsado")
            }) {
                //Estilo del boton
               Text("Hola Mundo")
                //2. Lo modificaremos
                    .padding() //El pading debe declararse antes del color o no se rellenara
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .font(.largeTitle)
            }
            
            //3. Crearemos otro boton diferente
            Button(action: {
                print("Boton 2 pulsado")
            }) {
               Text("Boton 2")
                    .foregroundColor(.orange)
                    .font(.largeTitle)
                    .padding()
                    .border(Color.green, width: 4)
            }
            
            //4. Crearemos otro boton mas
            Button(action: {
                print("Boton 3 pulsado")
            }) {
               Text("Boton 3")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(12)
                    .border(Color.green, width: 6)
            }
            //5. Como pueden apreciar el orden altera el boton, mi cremoendaciones seguir siempre un orden:
            Button(action: {
                print("Boton 4 pulsado")
            }) {
                Text("Boton 4")
                    //Primero los textos, el tamaño de la fuente
                    .font(.largeTitle)
                    .fontWeight(.black)
                    //Luego los colores
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    //Para finalizar con los bordes
                    .padding(12)
                    .border(Color.green, width: 6)
            }
            
            //6. Crearemos un boton redondeado
            Button(action: {
                print("Boton 5 pulsado")
            }) {
                Text("Boton 5")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    //Pondremos un cornerRadius
                    .cornerRadius(50)
                    //Como podemos apreciar solo redondeo el relleno pero no el boton
                    .padding(12)
                    //Para solucionarlo deberemos eliminar esta linea y agregar un overlay para agregar una capa adicional
                    /*.border(Color.green, width: 6)*/
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.orange, lineWidth: 5))//para eliminar el relleno azul
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
