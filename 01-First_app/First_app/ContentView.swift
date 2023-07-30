//
//  ContentView.swift
//  First_app
//
//  Created by Danilo Andrusco on 30-07-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hola, Mundo!")
                .fontWeight(.bold)
                .font(.system(.largeTitle, design: .rounded))//Con system se adapta el texto a la pantalla del iPhone
                .foregroundColor(.purple)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
