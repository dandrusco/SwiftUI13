//
//  ContentView.swift
//  anims
//
//  Created by Danilo Andrusco on 14-08-23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonColorChanged = false
    @State private var iconColorChanged = false
    @State private var iconSizeChanged = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 180, height: 180)
                .foregroundColor(buttonColorChanged ? Color(.systemGray4) : .green)
    
            Image(systemName: "keyboard")
                .font(.system(size: 80))
                .foregroundColor(iconColorChanged ? .green : Color(.systemGray6))
                .scaleEffect(iconSizeChanged ? 1.0 : 0.5)

        }
        //1. Para poder agregarle una animacion lo hacemos asi:
        .animation(.default, value: [buttonColorChanged, iconColorChanged, iconSizeChanged])
        
        .onTapGesture {
            buttonColorChanged.toggle()
            iconColorChanged.toggle()
            iconSizeChanged.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
