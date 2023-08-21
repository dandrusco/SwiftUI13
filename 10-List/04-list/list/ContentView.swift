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
            //1. Podemos simplificarlo aun mas eliminadno el ForEach
            /*List {
                ForEach(1...5, id: \.self) {
                    Text("Fila \($0)")
                }*/
            List(1...5, id: \.self) {
                    Text("Fila \($0)")
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
