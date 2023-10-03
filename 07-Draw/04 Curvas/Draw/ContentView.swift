//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//

//1. Pintaremos otra figura por debajo

import SwiftUI

struct ContentView: View {
    var body: some View {
        //2. Cambiaremos el VStack por un ZStack
        ZStack {
            //3. Pintaremos a continuacion:
            Path(){ path in
                path.move(to: CGPoint(x: 60, y: 130))
                path.addLine(to: CGPoint(x: 130, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 160))
                
            }
            Path(){ path in
                path.move(to: CGPoint(x: 30, y: 130))
                path.addLine(to: CGPoint(x: 60, y: 130))
                path.addQuadCurve(to: CGPoint(x: 200, y: 130), control: CGPoint(x: 130, y: 60))
                path.addLine(to: CGPoint(x: 230, y: 130))
                path.addLine(to: CGPoint(x: 230, y: 250))
                path.addLine(to: CGPoint(x: 30, y: 250))
            }
            .fill(Color.blue)
            //4. Para poder pintar el borde de la figura no se puede realizar despues de un .fill por lo tanto solo nos queda por copiar el codigo y pegarlo (duplicarlo) y le cambiamos el parametro de .fill por el de .stroke
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
