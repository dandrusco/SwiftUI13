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
            Text("Tectroya es una empresa especializada en el área de la informática. Nuestro trabajo se basa en interpretar las necesidades de nuestros clientes, identificar las oportunidades y desarrollar tecnologías innovadoras.")
                .fontWeight(.bold)
                .font(.system(.largeTitle, design: .rounded))//Con system se adapta el texto a la pantalla del iPhone
                .foregroundColor(.orange)
                .multilineTextAlignment(.center)
                .lineLimit(nil)//Cuantas linas quieres mostrar, por defacto es Nil
                .truncationMode(.tail)//Pone los ... al final
                .lineSpacing(8)//es para ancho entre lineas
                .padding()//Para darle mas espaco en los bordes del iPhone
                //.rotationEffect(.degrees(45))//Para rotar textos
                .rotation3DEffect(.degrees(50), axis: (x: 1, y: 0, z: 0))//Rotar texto en 3D
                .shadow(color: .gray, radius: 1, x: 0, y: 3)//Para dar sombra
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
