//
//  ContentView.swift
//  list
//
//  Created by Danilo Andrusco on 21-08-23.
//


import SwiftUI

struct ContentView: View {
    
    var cantantes = [
        Cantantes(nombre: "Metallica", imagen: "Metallica", fondo: .black),
        Cantantes(nombre: "ACDC", imagen: "ACDC", fondo: .black),
        Cantantes(nombre: "Daddy Yankee", imagen: "Daddy", fondo: .yellow),
        Cantantes(nombre: "Nicky Jam", imagen: "Nicky", fondo: .yellow),
        Cantantes(nombre: "Celia Cruz ", imagen: "Celia", fondo: .red),
        Cantantes(nombre: "Mack Anthony", imagen: "Marc", fondo: .red)
    ]
    
    var body: some View {
        VStack {
            Text("Cantantes y su genero")
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
            
            List(cantantes) { cantante in
                FilaCantantes(cantante: cantante)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Cantantes : Identifiable {
    var id = UUID()
    var nombre : String
    var imagen : String
    var fondo : Color
}

struct FilaCantantes: View {
    var cantante : Cantantes
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(cantante.fondo)
                    .frame(width: 80, height: 80)
                Image(cantante.imagen)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipped()
                    .cornerRadius(40)
            }
            Text(cantante.nombre)
                .font(.system(.title2, design: .rounded))
        }
    }
}
