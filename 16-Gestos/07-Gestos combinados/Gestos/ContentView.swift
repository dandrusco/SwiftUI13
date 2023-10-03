//
//  ContentView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 26-09-23.
//

//1. Realizaremos una combinacion de gesdtos, para ello tomaremos parte del cogido que desarrollamos llamado 04-Gesture State
import SwiftUI

struct ContentView: View {
    
    //2. Pegaremos estas lineas
    //Gestos prolongados
    @GestureState private var hasBeenLongPress = false
    
    //Gestos de arrastre
    @State private var position = CGSize.zero
    @GestureState private var offset = CGSize.zero
    
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .font(.system(size: 150))
                //3. Pegamos este otro codigo
                .opacity(hasBeenLongPress ? 0.5 : 1.0)
            
                .offset(x: position.width + offset.width,
                        y: position.height + offset.height)
                .animation(.easeIn, value: offset)
                .gesture(
                    //4. Pegaremos todo el codigo del LongPressGesture
                    LongPressGesture(minimumDuration: 0.5)
                        .updating($hasBeenLongPress){ (value, state, transaction) in
                            state = value
                        }
                    //5. LLamaremos a otro metodo para que actue despues de los 0.5 segundos de pulsacion y llame al DragGesture()
                        .sequenced(before: DragGesture())
                    //6. Borramos esta linea
                    /*DragGesture()*/
                        .updating($offset) { (value, state, transaction) in
                            //7. Ahora nos da error .translation ya que ahora DragGesture() pertenece a una secuencia, para solucionarlo deberemos implementar un Switch con el valor
                            switch value {
                            //8. El primer caso podria ser un valor booleano (El primer elemento es un booleano), seria un toque
                            case.first(true):
                                print("El gesto es un Tap")
                            //9. SI el segundo elemento que nos devuelve el valor es verdadero y ademas nos devuelve el DragGesture, significa que es un arrastre
                            case.second(true, let drag):
                                //10. Cortamos y pegamos la linea "state = value.translation" cambiando value por drag? y agregaremos la opcion en caso de que no exista que le proporcione el valor por defecto
                                state = drag?.translation ?? .zero
                            //11. Pondremos el valor por defecto
                            default:
                                break
                            }
                        }
                        .onEnded { (value) in
                            //12. deberemos agregar estos errores y lo haremos atraves de un guard, Si puedo recuperar la segunda parte del value que en principio es opcional, del segundo elemento del mismo y esto no da error, podre seguir adelante. Sino? abortamos
                            guard case .second(true, let drag?) = value else {
                                return
                            }
                            //13. Por el contrario cambiaremos el value por el drag
                            position.height += drag.translation.height
                            position.width += drag.translation.width
                        }
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
