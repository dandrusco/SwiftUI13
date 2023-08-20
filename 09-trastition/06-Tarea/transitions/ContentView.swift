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
                    //1. Se pueden crear transisiones asimetrica pero no esta funcionando del todo bien, pero igual dejamos el codigo
                    .transition(.asymmetric(insertion: .scale(scale: 0,anchor: .bottom), removal: .offset(x: -600, y: 0)))
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

extension AnyTransition {
    static var offsetScaleOpacityOut: AnyTransition {
        AnyTransition.offset(x: -700, y: 0)
            .combined(with: .scale)
            .combined(with: .opacity)
    }
}
