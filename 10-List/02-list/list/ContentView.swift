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
                //1. Para evar estar copiando y pegando lo podemos hacer con un bucle
                /*Text("Fila 1")
                Text("Fila 2")
                Text("Fila 3")
                Text("Fila 4")
                Text("Fila 5")*/
                ForEach(1...5, id: \.self) { index in
                    Text("Fila \(index)")
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
