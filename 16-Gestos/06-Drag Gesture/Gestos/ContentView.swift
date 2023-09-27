//
//  ContentView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 26-09-23.
//

//1. Si lo que queremos es que cuando movamos la manzana esta permanezxa en el estado en que la dejamos, deberemos hacer lo siguiente
import SwiftUI

struct ContentView: View {
    
    //2. deberemos crear una variable de estado para guardar el estado en que se encuentra la posicion
    @State private var position = CGSize.zero
    @GestureState private var offset = CGSize.zero
    
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .font(.system(size: 150))
                //4. Deberemos mofificar este offset
                /*.offset(x: offset.width, y: offset.height)*/
                //5. Permitiendo sumar donde se encontraba mas la cantidad de movimiento
                .offset(x: position.width + offset.width,
                        y: position.height + offset.height)
                .animation(.easeIn, value: offset)
                .gesture(
                    DragGesture()
                        .updating($offset) { (value, state, transaction) in
                            state = value.translation
                        }
                        //2. Cuando haya finalizado el movimiento y yo levante el dedo, deberemos invocar a metodo .onEnded para actualizar la posicion del objeto, capturando el valor
                        .onEnded { (value) in
                            //3. Actualizaremos el valor de la variable position incrementandola con el valor de la tranlation (movimiento) tanto para la anchura como su altura
                            position.height += value.translation.height
                            position.width += value.translation.width
                        }
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
