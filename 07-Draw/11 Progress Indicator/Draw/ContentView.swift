//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//

//1. Tambien estan las figuras predeterminadas

import SwiftUI

struct ContentView: View {
    //3. Crearemos una variable para el color de la gradiente
    private var gradiente = LinearGradient(gradient: Gradient(colors: [Color(red:50/255, green: 150/255, blue: 230/255), Color(red:70/255, green: 180/255, blue: 240/255)]), startPoint: .trailing, endPoint: .leading)
    
    var body: some View {
        //1. Partiremos cambiando a ZStack
        ZStack {
            //2. Crearemos un circulo
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 10)
                .frame(width: 200, height: 200)
            
            //4. Crearemos el segundo sirculo que ira por encima con la gradiente
            Circle()
                .trim(from: 0, to: 0.65)//Marcamos del 0 al 65%
                .stroke(gradiente, lineWidth: 20)
                .frame(width: 200, height: 200)
                .overlay(VStack{
                    Text("65%")
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                    Text("Numero de pasos")
                        .font(.system(.body,design: .rounded))
                        .bold()
                        .foregroundColor(Color(.systemTeal))
                })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
