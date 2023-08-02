//
//  ContentView.swift
//  Stacks
//
//  Created by Danilo Andrusco on 01-08-23.
//

import SwiftUI

//1.- Vamor a utilizar el Spacer para ordenar nuestra cabecera
struct ContentView: View {
    var body: some View {
        VStack {
            Titulo()

            HStack {
                PrecioViews(title: "Basico", price: "9.99", subtitle: "Un curso", textColor: .white, backgroundColor: .green)

                ZStack {
                    PrecioViews(title: "Premium", price: "29.99", subtitle: "Todos", textColor: .black, backgroundColor: .gray)

                    Text("La mejor opcion")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .padding(8)
                        .background(Color(red:240/255, green:180/255, blue:50/255))
                        .offset(x:0, y: -75)
                }
            }.padding()
            
            ZStack {
                PrecioViews(title: "Gold", price: "99.99", subtitle: "De por vida", textColor: .white, backgroundColor: .black, icon: "lightbulb").padding(.horizontal)
                
                Text("Todos los cursos de por vida")
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    .padding(8)
                    .background(Color(red:240/255, green:180/255, blue:50/255))
                    .offset(x:0, y: -97)
            
            }//5. Y Si ahora le ponemos otro Spacer, nos tirara todo hacia arriba
            Spacer()
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
        //2. Para poder expandirla horizontalmente debero metarla en una HStack
        HStack {
            VStack (alignment: .leading, spacing: 4) {
                Text("Elige tu curso")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                
                Text("para a aprender")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }//3. Eliminaremos el pading y crearemos un Spacer
            //.padding()
            Spacer()
            //4. AHora agregamos el padong
        }.padding()
    }
}

struct PrecioViews: View {
 
    var title: String
    var price: String
    var subtitle: String
    var textColor: Color
    var backgroundColor: Color
    var icon: String?
    
    var body: some View {
        VStack{
            icon.map({
                Image(systemName:$0)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            })
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
