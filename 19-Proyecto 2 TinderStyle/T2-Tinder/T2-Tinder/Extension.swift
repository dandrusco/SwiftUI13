//
//  Extension.swift
//  T2-Tinder
//
//  Created by Danilo Andrusco on 26-10-23.
//

import Foundation
import SwiftUI

//Efecto de caida
extension AnyTransition{
    static var trailingBottonAtRemoval: AnyTransition{
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition
                                    .move(edge: .trailing)
                                    .combined(with: .move(edge: .bottom)))
    }
    static var leadingBotonAtRemoval: AnyTransition{
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition
                                    .move(edge: .leading)
                                    .combined(with: .move(edge: .bottom)))
    }
}
