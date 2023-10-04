//
//  ContentView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 26-09-23.
//

//1. Crearemos una vista generica arrastrable por si en el futuro queremos por ejemplo arrastrar un texto en vez de una imagen
//2. Para ello crearemos un fichero de tipo Swift View que llamaremos DragggableView
import SwiftUI

struct ContentView: View {
    
    //6. Nos llevaremos estas dos lineas copiandolas y las pegaremos en el DraggableView
    @GestureState private var dragState = DragState.none
    @State private var position = CGSize.zero
    
    var body: some View {
        VStack {
            //9. Nos llevaremos el contenido del body y solo dejaremos la linea del imagen y font, pero lo encerraremos dentro de la DragggableView:
            DragggableView(){
                Image(systemName: "apple.logo")
                    .font(.system(size: 150))
            }
                /*.opacity(dragState.isPressing ? 0.5 : 1.0)
                .offset(x: position.width + dragState.translation.width,
                        y: position.height + dragState.translation.height)
                .animation(.easeIn, value: position)
                .gesture(
                    LongPressGesture(minimumDuration: 0.5)
                        .sequenced(before: DragGesture())
                        .updating($dragState) { (value, state, transaction) in
                            switch value {
                            case.first(true):
                                state = .pressing
                            case.second(true, let drag):
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
                )*/
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//3. Nos llevaremos todo el enumerado
/*enum DragState {
    case none
    case pressing
    case dragging(translation : CGSize)
    
    var translation : CGSize {
        switch self {
        case .none, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing : Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .none:
            return false
        }
    }
}*/
