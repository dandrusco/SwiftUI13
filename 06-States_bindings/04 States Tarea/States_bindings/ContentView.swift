//
//  ContentView.swift
//  States_bindings
//
//  Created by Danilo Andrusco on 06-08-23.
//

//1. Generar un boton que al ser precionado incremente en uno en uno

import SwiftUI

struct ContentView: View {
    //6. Decararemos el @State
    @State private var numClic = 0
    
    var body: some View {
        VStack {
            //5. Crearemos la accion del boton
            Button(action: {
                //9. Ahora aumentaremos numclic
                numClic += 1
            }) {
                //2. Crearemos un circulo de tamaño 150 y de color purpura
                Circle()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.purple)
                    //3. Para que el texto quede encima del circulo necesitamos un overlay
                    //7. Ahora modificaremos la linea de .overlay(Text("xxx")
                    /*.overlay(Text("xxx")*/
                    //8. por esta:
                    .overlay(Text("\(numClic)")
                        //4. Le daremos tamaño 80 y de color blanco
                        .font(.system(size: 80, weight: .bold, design: .rounded))
                        .foregroundColor(.white))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
