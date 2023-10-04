//
//  ContentView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 26-09-23.
//


import SwiftUI

struct ContentView: View {
    
    @GestureState private var dragState = DragState.none
    @State private var position = CGSize.zero
    
    var body: some View {
        VStack {
            DragggableView(){
                Image(systemName: "apple.logo")
                    .font(.system(size: 150))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
