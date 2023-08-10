//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//


import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //1. Partiremos cambiando a ZStack
        ZStack {
            //2. Crearemos un circulo
            Circle()
                .trim(from: 0.0, to: 0.3)//Utilizaremos del 0 al 30%
                .stroke(Color(.brown), lineWidth: 60)
            
            //3. Crearemos otro circulo
            Circle()
                .trim(from: 0.3, to: 0.5)
                .stroke(Color(.systemPink), lineWidth: 60)
            
            //4. Crearemos otro circulo
            Circle()
                .trim(from: 0.5, to: 0.75)
                .stroke(Color(.orange), lineWidth: 60)
            
            //5. Crearemos otro circulo
            Circle()
                .trim(from: 0.75, to: 1.00)
                .stroke(Color(.red), lineWidth: 70)
            //6. Destacaremos esta ultima
                .overlay(Text("25%")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .offset(x:90, y: -90))
            
            
        }
        //3. Crearemos un frame global para todo el ZStack
        .frame(width: 250, height: 250)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
