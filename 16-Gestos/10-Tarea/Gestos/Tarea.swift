//
//  Tarea.swift
//  Gestos
//
//  Created by Danilo Andrusco on 04-10-23.
//

import SwiftUI

struct ZoomableView<Content>: View where Content: View {
    @GestureState private var scale: CGFloat = 1.0
    @State private var magnification: CGFloat = 1.0
    
    var content: () -> Content
    
    var body: some View {
        content()
            .scaleEffect(scale * magnification)
            .gesture(
                MagnificationGesture()
                    .updating($scale) { value, scale, _ in
                        scale = value
                    }
                    .onEnded { value in
                        magnification *= value
                    }
            )
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZoomableView {
            Text("✈️")
                .font(.system(size: 200))
        }
    }
}
/*
1. Visor de imágenes con zoom: Puedes utilizar MagnificationGesture en una aplicación de visor de imágenes para permitir que los usuarios amplíen o reduzcan las imágenes utilizando gestos de pellizco o ampliación.
2. Edición de mapas: En una aplicación de mapas, MagnificationGesture podría utilizarse para permitir a los usuarios acercar o alejar el mapa mediante gestos de pellizco
3. Diseño de documentos o gráficos: En aplicaciones de diseño gráfico o de documentos, se puede emplear MagnificationGesture para permitir a los usuarios aumentar o disminuir el tamaño de los elementos, como texto o formas, para ajustarlos con precisión en la pantalla. */
