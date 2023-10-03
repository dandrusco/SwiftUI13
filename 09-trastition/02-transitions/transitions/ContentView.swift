//
//  ContentView.swift
//  transitions
//
//  Created by Danilo Andrusco on 19-08-23.
//

import SwiftUI

struct ContentView: View {
    @State private var showTranslation = false
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 250, height: 250)
                .foregroundColor(.orange)
                .overlay(
                    Text("Car")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                )
            //1 Encerraremos este segundo rectangulo en un IF
            if showTranslation {
                Rectangle()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.purple)
                    .overlay(
                        Text("Auto")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    )
                //3. Crearemos una transicion para desaparecer
                    /*.transition(.scale(scale: 0, anchor: .bottom))*/
                //.4 Comentaremos la liena de arriba para probar otra transition
                    .transition(.offset(x: -700, y: 0))
            }
        }.padding()
        
        //2. Si el uaurio presina la pantalla cambiaremos de false a true la variable showTranslation y viceversa
        .onTapGesture {
            withAnimation(Animation.spring()) {
                showTranslation.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
