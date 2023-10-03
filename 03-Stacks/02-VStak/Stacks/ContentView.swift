//
//  ContentView.swift
//  Stacks
//
//  Created by Danilo Andrusco on 01-08-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Crearemos otra VStack que contrada el actual VStack en su interior
        VStack {
            // Con la tecla comand marcaremos el Vstack y seleccionaremos Extract Subview, creara una nuva estructura mas abajo llamada ExtractedView(), le cambiaremos el nombre por Titulo
            Titulo()
            //Crearemos otra Vstack para los planes
            VStack{
                Text("Plan Basico")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("9,99 USD")
                    .font(.system(size: 35, design: .rounded))
                    .foregroundColor(.white)
                
                Text("Un curso incluido")
                    .font(.headline)
                    .foregroundColor(.white)
                
                
            }.padding(30)//Para que la escritura no quede pegada en los bordes
            .background(Color.green)//Para pintar el VStack
            .cornerRadius(10)//Darle bordes redondeados al VStack
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Titulo: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text("Elige tu curso")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
            
            Text("para a aprender")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
        }
        .padding()
    }
}
