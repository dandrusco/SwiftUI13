//
//  ContentView.swift
//  ScrollCardView
//
//  Created by Danilo Andrusco on 03-08-23.
//


//01. Crearemos un nuevo archillo llamado CardView como User Interface seleccionaremos SwiftUI View

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
