//
//  ContentView.swift
//  list
//
//  Created by Danilo Andrusco on 21-08-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //1. Para crear lista simplemente deberemos crear List y entre los { cada una de las listas }
            List {
                Text("Fila 1")
                Text("Fila 2")
                Text("Fila 3")
                Text("Fila 4")
                Text("Fila 5")
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
