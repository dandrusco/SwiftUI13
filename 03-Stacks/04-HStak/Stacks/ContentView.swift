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
            //Podeos ver que tanto el plan basico como el Premium ocupa los mismos parametros, manteniendo la tecla comand seleccionaremos el primer VStack y seleccionaremos la opcion Extracct Subview, por defecto la llama ExtractedView y la llamaremos PrecioViews, abajo en la struct PrecioViews: View que se nos ha creado, crearemos unas variables
            HStack {
                //Deberemos pasarle las variables o nos dara error
                PrecioViews(title: "Basico", price: "9.99", subtitle: "Un curso", textColor: .white, backgroundColor: .green)
                //Crearemos otra de Precio para el segundo plan
                PrecioViews(title: "Premium", price: "29.99", subtitle: "Todos", textColor: .black, backgroundColor: .gray)
                
                //Eliminaremos esta segunda VStack ya que la tenemos creada arriba (Yo la comentare)
                /*VStack{
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
                .cornerRadius(10)*/
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
    //Personalizaremos acontinuacion:
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
                //Reemplazados por las variables creadas
                .foregroundColor(textColor)
            
            Text(price)
                .font(.system(size: 35, design: .rounded))
                //Reemplazados por las variables creadas
                .foregroundColor(textColor)
            
            Text(subtitle)
                .font(.headline)
                //Reemplazados por las variables creadas
                .foregroundColor(textColor)
            
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
            .padding(30)
            //Reemplazados por las variables creadas
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
