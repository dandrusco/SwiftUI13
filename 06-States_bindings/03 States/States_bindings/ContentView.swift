//
//  ContentView.swift
//  States_bindings
//
//  Created by Danilo Andrusco on 06-08-23.
//

//1. Ahora deberemos pasar la variable isPlaying a true cuendo el boton sea presionado
import SwiftUI

struct ContentView: View {
    //2. Para monitorear una variable debemos utilizar @State para que SwiftUI se encargue de refrescar los cambios en su valor y las vistas
    //3. Si ponemos un @State debe declararse la variable como privada para eviar que alguien mas realice los cambios
    @State private var isPlaying = false
    
    var body: some View {
        VStack {
            Button(action: {
                //4. Los cambios los realizaremos en la accion, por lo tatno eliminaremos esta linea
                /*print("Boton play pulsado")*/
                isPlaying.toggle()//Toggle conviernte de true a false y viceversa
            }) {
                Image(systemName:isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .font(.system(size: 100))
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
