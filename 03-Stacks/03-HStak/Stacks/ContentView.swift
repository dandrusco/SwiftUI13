//
//  ContentView.swift
//  Stacks
//
//  Created by Danilo Andrusco on 01-08-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Titulo()
            //Con la tecla comand marcaremos el VStack y seleccionaremos Embed in Hstack, nos creara en sima esta HStack
            HStack {
                VStack{
                    Text("Basico")
                        .font(.system(size: 27, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("9,99")
                        .font(.system(size: 35, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text("Un curso")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                    .padding(30)
                .background(Color.green)
                .cornerRadius(10)
                
                VStack{
                    Text("Premium")
                        .font(.system(size: 27, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text("29,99")
                        .font(.system(size: 35, design: .rounded))
                        .foregroundColor(.black)
                    
                    Text("Todos")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
                .padding(30)
                .background(Color.gray)
                .cornerRadius(10)
            }.padding(.horizontal)
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
