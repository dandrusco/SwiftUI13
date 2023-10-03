//
//  LoadingView.swift
//  anims
//
//  Created by Danilo Andrusco on 17-08-23.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("Cargando")
                .font(.system(.title, design: .rounded))
                .bold()
                .offset(x:0, y:-30)
            
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color(.systemGray6), lineWidth: 5)
                .frame(width: 300, height: 4)
            
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 50, height: 4)
                .offset(x: isLoading ? 125 : -125, y:0)
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: isLoading)
                .onAppear() {
                    isLoading = true
                }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
