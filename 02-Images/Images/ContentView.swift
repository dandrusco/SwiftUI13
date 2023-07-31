//
//  ContentView.swift
//  Images
//
//  Created by Danilo Andrusco on 30-07-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "recordingtape")//Nombre del icono de Simbolos SF
                .font(.system(size: 80)) //tamaño
                .foregroundColor(.green) //Color
                .shadow(color:.gray, radius: 10, x: 0, y:10) //Sombreado
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
