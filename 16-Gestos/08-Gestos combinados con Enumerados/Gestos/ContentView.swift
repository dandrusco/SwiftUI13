//
//  ContentView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 26-09-23.
//

import SwiftUI

struct ContentView: View {
    
    //12. Ahora como un solo DragState podemos ver los dos estados podemos eliminar los dos estados de @GestureState
    //Gestos prolongados
    /*@GestureState private var hasBeenLongPress = false*/
    
    //13. Nos quedaremos solo con un @GestureState que sera de DragState pero que no realizara nada
    @GestureState private var dragState = DragState.none
    //Gestos de arrastre
    @State private var position = CGSize.zero
    /*@GestureState private var offset = CGSize.zero*/
    
    var body: some View {
        VStack {
            Image(systemName: "apple.logo")
                .font(.system(size: 150))
            //14. La opacidad depende si se habra o no pulsado, por lo tanto deberemos modificar esta linea
                /*.opacity(hasBeenLongPress ? 0.5 : 1.0)*/
            //15. Ahora depende de dragState.isPressing
                .opacity(dragState.isPressing ? 0.5 : 1.0)
                
            //21. por ultimo deberemos modificar estas lineas para corregir el error, cambiando el offset por dragState.translation
                .offset(x: position.width + dragState.translation.width,
                        y: position.height + dragState.translation.height)
                .animation(.easeIn, value: position)
                .gesture(
                    LongPressGesture(minimumDuration: 0.5)
                    //16. Eliminaremos el .updateting
                        /*.updating($hasBeenLongPress){ (value, state, transaction) in
                            state = value
                        }*/
                        .sequenced(before: DragGesture())
                    //17. actualizaremos el valor de .updating($offset) pero como $dragState
                        .updating($dragState) { (value, state, transaction) in
                            switch value {
                            case.first(true):
                                //18. Como estoy en el estado de pressing, borraremos el print y agregaremos
                                /*print("El gesto es un Tap")*/
                                //19. Indicamos que el estado sera el de presionado
                                state = .pressing
                            case.second(true, let drag):
                                //20. cambiaremos el drag?.translation por .dragging(translation: drag?.translation ?? .zero)
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                            }
                        }
                        .onEnded { (value) in
                            guard case .second(true, let drag?) = value else {
                                return
                            }
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

//1. Crearemos un enumerado para refactorizar el codigo actual y que se encargue del estado del Drag
enum DragState {
    //2. Un estado es que el drag no este haciendo nada
    case none
    //3. face de inicio
    case pressing
    //4. Moviendo, el cual le pasaremos el parametro de translation de tipo CGSize
    case dragging(translation : CGSize)
    
    //5. Crearemos 2 variables autocomputada, una para indicar la cantidad de moviemento
    var translation : CGSize {
        //7. La translacion final realizaremos un swich
        switch self {
        case .none, .pressing:
            //8. En el caso None y pressing no ha traslacion
            return .zero
        case .dragging(let translation):
            //9. En el caso dragging, lo que indique el paraetro translation
            return translation
        }
    }
    
    //6. la otra variables autocomputada, para ver si ha sido pulsada
    var isPressing : Bool {
        //10. Para el isPressing realizaremos lo mismo
        switch self {
        case .pressing, .dragging:
            //10. En el caso de .pressing, .dragging, devolvemos true
            return true
        case .none:
            //11. En el caso de .none devolvemos false
            return false
        }
    }
}
