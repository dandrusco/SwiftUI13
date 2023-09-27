//
//  ContentView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 26-09-23.
//

//1. Cambiaremos el LongPressGesture por Drag para poder arrastrar el icono, asi que realizaremos las siguientes modificaciones al codigi actual
import SwiftUI

struct ContentView: View {
    
    //2. Eliminaremos este estado ya que no lo utilizaremos
    /*@State private var hasBeenPressed = false*/
    //3. Cambiaremos el hasBeenLongPress por el nombre de offset y pasara de ser boleano a pertenecer a la clase CoreGrafic inicializado en cero
    @GestureState private var offset = CGSize.zero
    
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .font(.system(size: 150))
                //4. Eliminaremos el efecto la opacidad y escalado
                /* .opacity(hasBeenLongPress ? 0.5 : 1.0)
                .scaleEffect(hasBeenPressed ? 2.0 : 1.0) */
            
                //5. Agregaremos el offset con la anchura y altura
                .offset(x: offset.width, y: offset.height)
                //6. cambiaremos el hasBeenPressed por el offset
                .animation(.easeIn, value: offset)
                .gesture(
                    //7. Eliminaremos todas estas lineas para implemetar el Drag
                    /* LongPressGesture(minimumDuration: 0.5)
                        .updating($hasBeenLongPress){ (value, state, transaction) in
                            state = value
                        }
                        .onEnded{ _ in
                            hasBeenPressed.toggle()
                        } */
                    DragGesture()
                        //8. Realizaremos una actualizacion
                        .updating($offset) { (value, state, transaction) in
                            //9. Me quedare con el valor de la pocicion actual
                            state = value.translation
                            //10. compilamos y vemos que ahora la manzana se mueve por todos lados pero a la hora de soltarla esta regresa a su posicion original 
                        }
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
