//
//  LoadingView.swift
//  anims
//
//  Created by Danilo Andrusco on 17-08-23.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var animBegin = false
    @State private var circle = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius:animBegin ? 30 : 10)
                .frame(width: animBegin ? 60 : 250, height: 60)
                .foregroundColor(animBegin ? .blue : .green)
                .overlay{
                    Image(systemName: "keyboard")
                        .font(.system(.largeTitle))
                        .foregroundColor(.white)
                        .scaleEffect(circle ? 0.5 : 1.0)
                }
            //1. Para agregar un borde deberemos crear otro RoundedRectangle un poco mas grande
            RoundedRectangle(cornerRadius: animBegin ? 40 : 20)
                //3. Con Trin podemos generar que la animacion sea solo para el rectangulo
                .trim(from: 0, to: animBegin ? 0 : 1)
                .stroke(lineWidth: 8)
                .frame(width: animBegin ? 80 : 270, height: 80)
                .foregroundColor(animBegin ? .blue : .green)
            //2. Ahora si probamos la anumacion vemos que tambien tiene el borde el circulo pero solo lo queremos en el rectangulo
            
        }.onTapGesture {
            withAnimation(Animation.spring()){
                animBegin.toggle()
            }
            withAnimation(Animation.spring().repeatForever().delay(0.25)){
                circle.toggle()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
