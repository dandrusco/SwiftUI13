//
//  ContentView.swift
//  P3-AppleWallet
//
//  Created by Danilo Andrusco on 30-10-23.
//

import SwiftUI

struct ContentView: View {
    
    @State var cards: [Card] = tempCards
    
    @State var cardPresented = false
    
    @State var cardPressed = false
    
    @State var cardSelected: Card?
    
    //Vamos a realizar un traking para ver en que estado nos encontramos
    @GestureState private var dragState = DragState.none
    
    //para conseguir el abanico de cartas
    private let offset: CGFloat = 75.0
    
    //Modificamos el ofset para que cada una tenga mas offset que el anterior
    private func offset(for card: Card)->CGSize{
        //Creamos un indice de la tarjeta actual
        guard let idx = index(for: card) else {
            return CGSize() //(0,0)
        }
        
        if cardPressed{
            guard let cardSelected = cardSelected,
                let cardSelectedIdx = cards.firstIndex(where: {$0.id == cardSelected.id}) else{
                    return CGSize()
            }
            if cardSelectedIdx <= idx {
                return CGSize()
            }else{
                return CGSize(width: 0, height: 3000)
            }
        }
        
        //Calcularemos si la estamos arrastrando para corregir la posicion
        var pressedOffset = CGSize.zero
        var dragOffset : CGFloat = 0
        
        if let dragIdx = dragState.idx, dragIdx == idx {
            pressedOffset.height = dragState.isPressing ? -20 : 0
            
            switch dragState.translation.width {
            case let width where width < -15:
                pressedOffset.width = -25
            case let width where width > 15:
                pressedOffset.width = 25
            default:
                break
            }
            
            dragOffset = dragState.translation.height
        }
        
        //Obtenemos la pocision real del desplazamiento
        return CGSize(width: 0 + pressedOffset.width,
                      height: -offset * CGFloat(idx) + pressedOffset.height + dragOffset)
    }
    
    //Invertiremos el otrden de las tarjetas
    private func zIndex(for card: Card) -> Double{
        guard let idx = index(for: card) else {
            return 0.0
        }
        
        //Indice por defecto
        let defaultIndex = -Double(idx)
        
        //Recuperamos el indice que se esta desplazando
        if let dragIdx = dragState.idx,
            dragIdx == idx {
            
            return defaultIndex + Double(dragState.translation.height / offset)
        }
        
        return defaultIndex
    }
    
    private func index(for card: Card) -> Int? {
        guard let idx = cards.firstIndex(where: {$0.id == card.id}) else{
                return nil
        }
        return idx
    }
    
    //Reeordenaremos las tarjetas al soltar
    private func orderCards(for card: Card, dragOffset: CGSize){
        guard let oldIdx = index(for: card) else{
            return
        }
        
        var newIdx = oldIdx - Int(dragOffset.height / offset)
        
        if(newIdx >= cards.count){
            newIdx = cards.count - 1
        }
        if(newIdx < 0){
            newIdx = 0
        }
        
        let removedCard = cards.remove(at: oldIdx)
        cards.insert(removedCard, at: newIdx)
        
        
    }
    
    var body: some View {
        VStack {
            TopBar()
            Spacer()
            ZStack{
                if cardPresented{
                    ForEach(cards){ c in
                        CardView(card: c)
                            .offset(offset(for: c))
                            .animation(.default, value: offset(for: c))
                            .scaleEffect(1.0)
                            .padding(.horizontal, 20)
                            .zIndex(zIndex(for: c))
                            .shadow(color: .gray, radius: 1.5, x: 1.0, y: 1.0)
                            .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                            .animation(animation(for: c), value: offset(for: c))
                            .gesture(TapGesture()
                                .onEnded({ _ in
                                    withAnimation{
                                        cardPressed.toggle()
                                        cardSelected = cardPressed ? c : nil
                                    }
                                })
                                .exclusively(before: LongPressGesture(minimumDuration: 0.1)
                                //SOLO DEBE EJECUTARSE DESPUES DE UNA PULSACION LARGA
                                    .sequenced(before: DragGesture())
                                    .updating($dragState, body: { (value, state, transaction) in
                                        
                                        switch value{
                                        case .first(true):
                                            state = .pressing(idx: index(for: c))
                                        case .second(true, let drag):
                                            state = .dragging(idx: index(for: c), translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                        }
                                    })
                                        .onEnded({ (value) in
                                            guard case .second(true, let drag?) = value else{
                                                return
                                            }
                                            orderCards(for: c, dragOffset: drag.translation)
                                        })
                                    )
                            )
                    }
                }
            }.onAppear{
                cardPresented.toggle()
            }
            if cardPressed{
                TransactionHistoryView()
                    .padding(.top, 20)
                    .transition(.move(edge: .bottom))
                    .animation(Animation.linear(duration: 0.2).delay(0.1), value: 20)
            }
            Spacer()
        }
    }
    //Funcion para la animacion de las tarjetas
    private func animation(for card: Card) -> Animation {
        var delay = 0.0
        
        if let idx = index(for: card){
            delay = Double(cards.count - idx)*0.2
        }
        return Animation.spring(response: 0.2, dampingFraction: 1, blendDuration: 0.2).delay(delay)
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
