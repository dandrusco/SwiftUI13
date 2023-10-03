//
//  ContentView.swift
//  States_bindings
//
//  Created by Danilo Andrusco on 06-08-23.
//

//1. En codigo anterior vemos que independiente de que boton toquemos estos sumaran en todos, asi que lo solucionaremos agregando un sumador de todos los numeros y cada boton sea independiente

import SwiftUI

struct ContentView: View {
    //3. Para que cada boton trabaje de manera independiente deberemos crear 3 State numClic1..3
    @State private var numClic1 = 0
    @State private var numClic2 = 0
    @State private var numClic3 = 0
    
    var body: some View {
        VStack {
            //2. Crearemos el texto encargado de sumar
            //5. deberemos cambiar el texto de Text("\(numClic)") por uno que sume los 3
            /*Text("\(numClic)")*/
            Text("\(numClic1 + numClic2 + numClic3)")
                .font(.system(size: 100, weight: .black, design: .rounded))
            //4. Ahora deberemos cambiar la referencia por numClic1..3
            VistaContador(numClic: $numClic1, buttonColor: .purple)
            VistaContador(numClic: $numClic2, buttonColor: .yellow)
            VistaContador(numClic: $numClic3, buttonColor: .green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct VistaContador: View {
    
    @Binding var numClic: Int
    
    var buttonColor: Color
    
    var body: some View {
        Button(action: {
            numClic += 1
        }) {
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(buttonColor)
                .overlay(Text("\(numClic)")
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(.white))
        }
    }
}
