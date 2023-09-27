//
//  ContentView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 26-09-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //1. Tomaremos cualquier imagen de los SF Simbols y le pondremos un tamaño 150
            Image(systemName: "apple.logo")
                .font(.system(size: 150))
            //2. Agregaremos el primer gesto
                .gesture(
                    //3. Añadiremos  un TapGesture
                    TapGesture()
                        //4. Le agregaremos un metodo para cuando acabe el toque, que se ejecute algo
                        .onEnded{
                            print("Me han tocado")
                        }
                )
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
