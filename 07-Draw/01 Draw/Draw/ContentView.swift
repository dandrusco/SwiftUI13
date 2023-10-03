//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//

//1. Para poder crear trazados (lienas) y poder pintarlas deberemos ocupar Path() de swiftUI y dandole las cordenadas con la clase de Core Grafic de iOS 
//2. Crearemos un rectangulo de color azul

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //3. Inicializamos el camnio con Path y entre {} le debemos pasar las instrucciones
            Path(){ path in
                //4. Con Move le decimos pon el lapiz en la cordenada...
                path.move(to: CGPoint(x: 30, y: 30))
                //5. Ahora le decimos que tire una linea hasta la cordenada...
                path.addLine(to: CGPoint(x: 230, y: 30))
                //6. Nuevamente le decimos que tire una linea hasta la cordenada...
                path.addLine(to: CGPoint(x: 230, y: 150))
                //7. Nuevamente le decimos que tire una linea hasta la cordenada...
                path.addLine(to: CGPoint(x: 30, y: 150))
                //8. No hace falta decirle que ahora vuelva al punto inical para cerrar el rectangulo ya que Swift lo entiende
            }
            //9. ahora con el modificador .fill lo pintamos azul
            .fill(.blue)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
