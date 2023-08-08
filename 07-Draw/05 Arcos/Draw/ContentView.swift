//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//

//1. Ahora dibujaremos un arco

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Path(){ path in
                //2. Deberemos ponerlo en el punto de partida
                path.move(to: CGPoint(x: 200, y: 250))
                //3. Utilizaremos el .addArc para dibujar el arco
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 0),
                            endAngle: Angle(degrees: 90),
                            clockwise: true)//clockwise significa en el sentido anti-horario (manecillas del reloj)
            }//4. Ahora lo pintaremos amarillo
            .fill(Color.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
