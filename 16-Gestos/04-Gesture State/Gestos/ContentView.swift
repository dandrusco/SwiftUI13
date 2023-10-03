//
//  ContentView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 26-09-23.
//


import SwiftUI

struct ContentView: View {
    
    @State private var hasBeenPressed = false
    //1. Crearemos un GestureState para validar una pulsacion larga
    @GestureState private var hasBeenLongPress = false
    
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .font(.system(size: 150))
                //2. Crearemos un modificador de opacidad para darle una mejor experiencia al usuario al mantener pulsada la imagen
                .opacity(hasBeenLongPress ? 0.5 : 1.0)
                .scaleEffect(hasBeenPressed ? 2.0 : 1.0)
                .animation(.easeIn, value: hasBeenPressed)
                .gesture(
                    LongPressGesture(minimumDuration: 0.5)
                        //3. Invocaremos otro metodo de actualizando para enviarle a la GestureState el estado en el que se encuentra la pulsacion prolongada, deberemos bindearla con el $.
                        //4. Este clouser nos devuelve 3 cosas: el valor actual (variable boobleana), el estado (el estado actual) y el transaccion (se encarga de cambiar una cosa de otra)
                        .updating($hasBeenLongPress){ (value, state, transaction) in
                            //5. le indicamos que el estado sera el mismo del value actual
                            state = value
                        }
                        .onEnded{ _ in
                            hasBeenPressed.toggle()
                        }
                )
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
