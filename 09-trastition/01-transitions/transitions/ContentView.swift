//
//  ContentView.swift
//  transitions
//
//  Created by Danilo Andrusco on 19-08-23.
//

import SwiftUI

struct ContentView: View {
    //3. La idea es que ahora una de las dos este oculta y al precionar cambiaremos una por la otra
    //4. Para ello crearemos una variable de estado
    @State private var showTranslation = false
    
    var body: some View {
        VStack {
            //1. Crearemos un rectangulo
            Rectangle()
                .frame(width: 250, height: 250)
                .foregroundColor(.orange)
                .overlay(
                    Text("Car")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                )
            //2. Crearemos tro rectangulo
            Rectangle()
                .frame(width: 250, height: 250)
                .foregroundColor(.purple)
                .overlay(
                    Text("Auto")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
