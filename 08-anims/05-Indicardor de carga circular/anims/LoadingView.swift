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
        //1. Crearemos otro circulo por debajo con una ZStack
        ZStack {
            //2. Pintaremos un circulo estatico de color gris
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 16)
                .frame(width: 150, height: 150)
            Circle()
                //3. Modificaremos a un mas pequeño, al 30%
                .trim(from: 0.0, to: 0.3)
                .stroke(Color.green, lineWidth: 8)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false), value: isLoading)
                .onAppear(){
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
