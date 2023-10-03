//
//  ContentView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 26-09-23.
//


//1. programaremos para cuando se toque la imagen se agrende y con otro toque se achique
import SwiftUI

struct ContentView: View {
    
    //2. deberemos crear un stado para saber si se a tocado o no la imagen
    @State private var hasBeenPressed = false
    
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .font(.system(size: 150))
                 //3. Crearemos una escala para modificar la imagen siempre y cuando sea tocado
                .scaleEffect(hasBeenPressed ? 2.0 : 1.0)
                //4. Habilitaremos la animacion
                .animation(.easeIn, value: hasBeenPressed)
                .gesture(
                    TapGesture()
                        .onEnded{
                            //5. Eliminaremos esta linea
                            /*print("Me han tocado")*/
                            //6. Cambiaremos de false a true y viceversa
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
