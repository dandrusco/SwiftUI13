//
//  LoadingView.swift
//  anims
//
//  Created by Danilo Andrusco on 17-08-23.
//

import SwiftUI

struct LoadingView: View {
    
    //3. Crearemos la variable de estado para la carga en falso
    @State private var isLoading = false
    
    var body: some View {
        //1. Trabajaremos con una HStack para crear la animacion de 6 circulos de carga
        HStack {
            //2. Con ForEach crearemos los 6circulos
            ForEach(0...5, id: \.self) { index in
                Circle()
                .frame(width: 16, height: 16)
                .foregroundColor(Color.green)
                //4. Crearemos una animacion que cuando vaya cargando los puntos vayan desarareciendo
                .scaleEffect(isLoading ? 0: 1)
                //5. Creamos la animacion de 0.5 segundo que se repita por siempre, le agregaremos un dalay para que se retrase la animacion, para retrasarla lo dividimos por 6 (por los 6 circulos)
                .animation(Animation.linear(duration: 0.5).repeatForever().delay(Double(index)/6), value: isLoading)
            }
        }//6. COn el metodo onApper pasamos de false a true para que apenas arranque la aplicacion se vea la animacion 
        .onAppear() {
            isLoading = true
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
