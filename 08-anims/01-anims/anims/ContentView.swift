//
//  ContentView.swift
//  anims
//
//  Created by Danilo Andrusco on 14-08-23.
//

import SwiftUI

struct ContentView: View {
    
    //1. Crearemos 3 estados privados en principio todos false
    @State private var buttonColorChanged = false
    @State private var iconColorChanged = false
    @State private var iconSizeChanged = false
    
    var body: some View {
        //2. Lo crearemos en una ZStack
        ZStack {
            //3. Crearemos un circulo
            Circle()
                .frame(width: 180, height: 180)
            //4. Si no esta precionado sera de color verde, de lo contrario en plomo
                .foregroundColor(buttonColorChanged ? Color(.systemGray4) : .green)
            
            //5. Crearemos la imagen del teclado
            Image(systemName: "keyboard")
                .font(.system(size: 80))
                //6. Su color sera plomo y al pulsarlo cambiara a verde
                .foregroundColor(iconColorChanged ? .green : Color(.systemGray6))
                //7. Si lo cambiamos de tamalo sera de 1.0 y si cambiamos su estado a 0.5
                .scaleEffect(iconSizeChanged ? 1.0 : 0.5)
        }//8. Crearemos un .onTapGesture que nos capturara si hacemos clic en la ZStack
        .onTapGesture {
            //9. Si es presionado, hara lo siguiente:
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
