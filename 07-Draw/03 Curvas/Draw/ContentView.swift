//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//

//1. Tomando el ejemplo del archivo 01 Draw dibujaremos curvas

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Path(){ path in
                //2. Cambiaremos las coordenadas
                path.move(to: CGPoint(x: 30, y: 130))
                //4. Si queremos que la curva este en el centro
                path.addLine(to: CGPoint(x: 60, y: 130))
                //3. Añadiremos la curva con addQuadCurve
                //4. Modificaremos esta linea por:
                /*path.addQuadCurve(to: CGPoint(x: 230, y: 130), control: CGPoint(x: 130, y: 0))*/
                path.addQuadCurve(to: CGPoint(x: 200, y: 130), control: CGPoint(x: 130, y: 60))
                //2.1 Cambiaremos las coordenadas
                path.addLine(to: CGPoint(x: 230, y: 130))
                //2.2 Cambiaremos las coordenadas
                path.addLine(to: CGPoint(x: 230, y: 250))
                //2.3 Cambiaremos las coordenadas
                path.addLine(to: CGPoint(x: 30, y: 250))
            }
            .fill(Color.blue)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
