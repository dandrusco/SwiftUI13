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
                    //1. Para poner combinar transiciones deberemos al .offset anteponerle un AnyTranstion o nos dara un error, luego le agregaremos la segunda transision .scale, e incluso darle una tercera que seria una opacidad
                    .transition(AnyTransition.offset(x: -700, y: 0).combined(with: .scale).combined(with: .opacity))
            }
        }.padding()
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
