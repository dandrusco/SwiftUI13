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
            List {
                //1. Se puede presindir del index realizando los siguientes cambios
                /*ForEach(1...5, id: \.self) { index in
                    Text("Fila \(index)")
                }*/
                ForEach(1...5, id: \.self) { //Se elimina el indix
                    Text("Fila \($0)") //Se cambia el index por $0
                }
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
