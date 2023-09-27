//
//  ContentView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 26-09-23.
//


import SwiftUI

struct ContentView: View {
    
    @State private var hasBeenPressed = false
    
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .font(.system(size: 150))
                .scaleEffect(hasBeenPressed ? 2.0 : 1.0)
                .animation(.easeIn, value: hasBeenPressed)
                .gesture(
                    //1. Si lo que queremos es que el icono se agrande miesntras se mantiene pulsado deberemos cambiar esta linea
                    /*TapGesture()*/
                    //2. por LongPressGesture, indicando que se active si la pulsacion dura mas de 0.5 segundo
                    LongPressGesture(minimumDuration: 0.5)
                        //3. El .onEnd pide u argumento por lo tanto como no lo utilizaremos le pondremos una _ in
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
