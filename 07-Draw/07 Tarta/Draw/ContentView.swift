//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//

//1. A veces estos graficos de torta destacan un valor mas que otros

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 0),
                            endAngle: Angle(degrees: 200),
                            clockwise: true)
            }.fill(Color(.systemBlue))
            
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 200),
                            endAngle: Angle(degrees: 160),
                            clockwise: true)
            }.fill(Color(.systemPink))
            //2. Para ellos utilizaremos offset
            .offset(x: -30, y: 0)
            
            //3. copiaremos el mimso codigo y lo pegaremos para dibujar el contorno
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 200),
                            endAngle: Angle(degrees: 160),
                            clockwise: true)
                //4. Deberemos cerrrar el path
                path.closeSubpath()
            }
            //5. Cambiamos el .fill por .stroke y el color y su anchura
            .stroke(Color(.systemBrown), lineWidth: 10)
            .offset(x: -30, y: 0)
            //6. Agregaremos un overlay para ponerle un texto
            .overlay(
                Text("11.1%")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .offset(x:-130, y:-130)
            )
            
            
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 160),
                            endAngle: Angle(degrees: 110),
                            clockwise: true)
            }
            .fill(Color(.systemIndigo))
            
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 110),
                            endAngle: Angle(degrees: 0),
                            clockwise: true)
            }
            .fill(Color(.systemTeal))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
