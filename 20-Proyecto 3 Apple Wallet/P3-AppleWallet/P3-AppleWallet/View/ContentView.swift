//
//  ContentView.swift
//  P3-AppleWallet
//
//  Created by Danilo Andrusco on 30-10-23.
//

import SwiftUI

struct ContentView: View {
    
    //para conseguir el abanico de cartas
    private let offset: CGFloat = 75.0
    
    //Modificamos el ofset para que cada una tenga mas offset que el anterior
    private func offset(for card: Card)->CGSize{
        //Creamos un indice de la tarjeta actual
        guard let idx = cards.firstIndex(where: {$0.id == card.id}) else {
            return CGSize() //(0,0)
        }
        //Obtenemos la pocision real del desplazamiento
        return CGSize(width: 0, height: -offset * CGFloat(idx))
    }
    
    //Invertiremos el otrden de las tarjetas
    private func zIndex(for card: Card) -> Double{
        guard let idx = cards.firstIndex(where: {$0.id == card.id}) else {
            return 0.0
        }
        return -Double(idx)
    }
    
    var body: some View {
        VStack {
            TopBar()
            Spacer()
            ZStack{
                ForEach(cards){ c in
                    CardView(card: c)
                        .offset(offset(for: c))
                        .padding(.horizontal, 20)
                        .zIndex(zIndex(for: c))
                        .shadow(color: .gray, radius: 1.5, x: 1.0, y: 1.0)
                    //TODO: girar el orden de las tarjetas zIndex
                }
            }
            Spacer()
        }
    }
}

struct CardView: View {
    var card: Card
    
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(
                VStack (alignment: .leading){
                    Text(card.number)
                        .bold()
                    
                    Text(card.clientName)
                        .bold()
                    
                    HStack {
                        Text("Valida hasta:")
                            .font(.caption)
                        Text(card.expirationDate)
                            .font(.caption)
                    }
                    
                }
                    .foregroundStyle(.white)
                    .padding(.leading, 55)
                    .padding(.bottom, 45)
                    .shadow(color: .black, radius: 1.5, x: 0.0, y: 1.0)
                , alignment: .bottomLeading
            )
    }
}

#Preview {
    ContentView()
    //CardView(card: cards[0]).previewLayout(.sizeThatFits)
}


struct TopBar: View {
    var body: some View {
        HStack {
            Text("Cartera")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
            
            Spacer()
            
            Image(systemName: "plus.circle")
                .font(.system(.largeTitle))
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 30)
    }
}
