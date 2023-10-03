//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//

//1. Tomaremos el mismo ejemplo del archiv 04 Curvas

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            //2. Eliminaremos el primer path
            /*Path(){ path in
                path.move(to: CGPoint(x: 60, y: 130))
                path.addLine(to: CGPoint(x: 130, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 160))
                
            }*/
            
            Path(){ path in
                //3. Para popder pintar esta figura utilizamos 6 lineas de codigo pero podemos simplificarlo creando una curva mas un rectangulo
                //6. cambaremos en punto de partida de x a 60
                path.move(to: CGPoint(x: 60, y: 130))
                //4. Eliminamos esta liena de codigo
                /*path.addLine(to: CGPoint(x: 60, y: 130))*/
                path.addQuadCurve(to: CGPoint(x: 200, y: 130), control: CGPoint(x: 130, y: 60))
                //5. Y eliminaremos las ultimas 3 lienas de codigos
                /*path.addLine(to: CGPoint(x: 230, y: 130))
                path.addLine(to: CGPoint(x: 230, y: 250))
                path.addLine(to: CGPoint(x: 30, y: 250))*/
                
                //7. Ahora crearemos un path de rectangulo indicandole la altura y anchura
                path.addRect(CGRect(x: 30, y: 130, width: 200, height: 120))
            }
            .fill(Color.blue)
            
            Path(){ path in
                path.move(to: CGPoint(x: 30, y: 130))
                path.addLine(to: CGPoint(x: 60, y: 130))
                path.addQuadCurve(to: CGPoint(x: 200, y: 130), control: CGPoint(x: 130, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 130))
                path.addLine(to: CGPoint(x: 230, y: 250))
                path.addLine(to: CGPoint(x: 30, y: 250))
                //5. deberemos cerrar el trazo
                path.closeSubpath()
            }
            .stroke(Color.red, lineWidth: 10)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
