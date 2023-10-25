//
//  ContentView.swift
//  T2-Tinder
//
//  Created by Danilo Andrusco on 23-10-23.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var dragState = DragState.none
    
    //Inicializamos un arrays de cartas que contengan todos nuestros cursos
    var deck: [CardView] = {
        var cards = [CardView]()
        
        for idx in 0..<2{
            cards.append(CardView(course: courses[idx]))
        }
        return cards
    }()
    
    var body: some View {
        VStack {
            TopBarView()
            Spacer(minLength: 10)
            //Apilamos todas las cartas, una encima de las otras
            ZStack {
                ForEach(deck) { card in
                    card.zIndex(isTopCard(card: card) ? 1 : 0)
                        .offset(x: isTopCard(card: card) ? dragState.translation.width : 0,
                                y: isTopCard(card: card) ? dragState.translation.height : 0)
                        .scaleEffect(dragState.isDragging && isTopCard(card: card) ? 0.9 : 1.0)
                        .rotationEffect(Angle(degrees: Double(isTopCard(card: card) ? dragState.translation.width/10 : 0)))
                        .animation(.interpolatingSpring(stiffness: 200, damping: 100), value: dragState.translation)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating($dragState, body: { (value, state, transaction) in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                        )
                }
            }
            BottonBarView()
                .opacity(dragState.isDragging ? 0.1 : 1.0)
                .animation(.linear, value: dragState.isDragging)
        }
    }
    //Crearemos un metodo para ordenar las cartas por su indice
    private func isTopCard(card: CardView) -> Bool {
        guard let idx = deck.firstIndex(where: {$0.id == card.id})
        else {
            return false
        }
        return idx == 0
    }
}

#Preview {
    ContentView()
}


struct TopBarView: View {
    var body: some View {
        HStack{
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 25))
                .foregroundStyle(.black)
            Spacer()
            Image(systemName: "book.fill")
                .font(.system(size: 35))
                .foregroundStyle(.black)
            Spacer()
            Image(systemName: "archivebox.fill")
                .font(.system(size: 25))
                .foregroundStyle(.black)
        }.padding(15)
    }
}


struct BottonBarView: View {
    var body: some View {
        HStack{
            Image(systemName: "xmark")
                .font(.system(size: 25))
                .foregroundStyle(.black)
            Spacer()
            Button(action: {
                //Comprar el curso
            }, label: {
                Text("Comprar el curso")
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.all, 20)
                    .background(Color.black)
                    .cornerRadius(12)
            }).padding(15)
            Spacer()
            Image(systemName: "heart")
                .font(.system(size: 25))
        }.padding(15)
    }
}
