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
            //1. Eliminaremos todo esto para crear el primer boton
            
            /*Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")*/
            
            //2. Arriba del todo en la parte derecha hay un boton +, alli podemos seleccionar Button y lo arrastraremos hasta aqui
            //3. Por defecto nos creara un Button con el nombre "Button" (Se lo podemos modificar), seguido de una Action
            //4. La Action quiere decir "Que debe hacer el boton" (Su comportamiento)
            //5. Le cambiaremos el nombre del boton por Hola Mundo
            Button("Hola Mundo") {
                // La accion sera imprimir "Boton Hola Mundo pulsado"
                print("Boton Hola Mundo pulsado")
                //6. En la izquina infereior derecha hau una ventana, al hacer clic se nos mostrara la consola
                //7. Ahora le daremos al boton y veremos como la consola aparece Boton Hola Mundo pulsado
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
