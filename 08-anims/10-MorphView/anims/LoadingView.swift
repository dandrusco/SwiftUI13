//
//  LoadingView.swift
//  anims
//
//  Created by Danilo Andrusco on 17-08-23.
//

import SwiftUI

struct LoadingView: View {
    
    //2. Para generar esos cambios de estados deberemos generar un @State
    @State private var animBegin = false
    //3. Crearemos otro estado para ver en que estado me encuentro el circulo
    @State private var circle = false
    
    var body: some View {
        //1. Convertiremos un rectangulo en un circulo, partiremos creandolo en una ZStack
        ZStack {
            //4. Crearemos el rectangulo dependiendo si esta en verdadero o falso
            RoundedRectangle(cornerRadius:animBegin ? 30 : 10)
                .frame(width: animBegin ? 60 : 250, height: 60)
                .foregroundColor(animBegin ? .blue : .green)
                //5. Le pondremos una imagen de teclado
                .overlay{
                    Image(systemName: "keyboard")
                        .font(.system(.largeTitle))
                        .foregroundColor(.white)
                        //6. Crearemos un efecto a la imagen dependiendo si estamos en circulo
                        .scaleEffect(circle ? 0.5 : 1.0)
                }
        }//7. Crearemos un onTapGesture para que se accione al presionar
        .onTapGesture {
            //8. Crearemos la animacion de rebote
            withAnimation(Animation.spring()){
                //9. Con Toggle cambiamos de animando a no animando
                animBegin.toggle()
            }
            //10. Creamos otra animacion con un delay de 0.25 segundo cambiando elestado del circulo
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
