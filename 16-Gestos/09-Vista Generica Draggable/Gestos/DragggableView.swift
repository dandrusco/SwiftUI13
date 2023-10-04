//
//  DragggableView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 04-10-23.
//

import SwiftUI

//5. Modificcaremos esta linea "struct DragggableView: View" ya que en la actualidad la estructura ereda de View y eso no nos sive para datos genericos, para ello le agregaremos Content
struct DragggableView<Content>: View where Content: View {
    //7. Las copiamos aqui:
    @GestureState private var dragState = DragState.none
    @State private var position = CGSize.zero
    
    //8. Decalreremos una variable que sera el contenido de la DragggableView, el contenido sera un clouser (nada de entrada pero devolvera una Content)
    var content: () -> Content
    
    var body: some View {
        //10. Borramos este Text
        /*Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)*/
        //11. Pegamos el codigo aqui:
        //12. Tanto la imagen y la fuente lo reemplazaremos por el clouser content()
        /*Image(systemName: "apple.logo")
            .font(.system(size: 150))*/
        content()
            .opacity(dragState.isPressing ? 0.5 : 1.0)
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
            )
    }
}

#Preview {
    //13 Ahora a la DragggableView() deberemos ponerle unos corchetes
    DragggableView() {
        //14. En su interior le pasaremos la imagen, texto, etc (lo que queremos que se arrastre, en nuestro caso probaremos con un texto
        Text("Tectroya")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundStyle(.green)
    }
}

//4. Lo pegaremos aqui:
enum DragState {
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
}
