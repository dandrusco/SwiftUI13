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
                    //4. Ahoa cambiamos el codigo del interior de transtion
                    /*.transition(AnyTransition.offset(x: -700, y: 0).combined(with: .scale).combined(with: .opacity))*/
                    .transition(.offsetScaleOpacityOut) //Al poner el punto nos muestas las variables estaticas
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

//1. Crearemos una transicion personalizada, para ello crearemos una extencion de AnyTransition
extension AnyTransition {
    //2. Crearemos una variable estatica que sea un objeto de la clase AnyTransition
    static var offsetScaleOpacityOut: AnyTransition {
        //3. Copiamos el codido de nuestra animacion sin el .transition
        AnyTransition.offset(x: -700, y: 0)
            .combined(with: .scale)
            .combined(with: .opacity)
    }
}
