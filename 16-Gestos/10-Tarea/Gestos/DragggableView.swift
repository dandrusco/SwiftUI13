//
//  DragggableView.swift
//  Gestos
//
//  Created by Danilo Andrusco on 04-10-23.
//

import SwiftUI

struct DragggableView<Content>: View where Content: View {

    @GestureState private var dragState = DragState.none
    @State private var position = CGSize.zero
    
    var content: () -> Content
    
    var body: some View {
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
    DragggableView() {
        Text("Tectroya")
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundStyle(.green)
    }
}

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
