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

            HStack {
                PrecioViews(title: "Basico", price: "9.99", subtitle: "Un curso", textColor: .white, backgroundColor: .green)
                //Tomaremos este segundo PrecioViews y lo meteremos dentro de un ZStack:
                ZStack {
                    PrecioViews(title: "Premium", price: "29.99", subtitle: "Todos", textColor: .black, backgroundColor: .gray)
                    //Le pondremos un texto por encima del plan Plemium
                    Text("La mejor opcion")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .padding(8)
                        .background(Color(red:240/255, green:180/255, blue:50/255))
                        .offset(x:0, y: -75)
                }
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

struct PrecioViews: View {
 
    var title: String
    var price: String
    var subtitle: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        VStack{
            Text(title)
                .font(.system(size: 27, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(textColor)
            
            Text(price)
                .font(.system(size: 35, design: .rounded))
                .foregroundColor(textColor)
            
            Text(subtitle)
                .font(.headline)
                .foregroundColor(textColor)
            
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
            .padding(30)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
