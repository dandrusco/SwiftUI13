//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//

//1. Si no queremos pintar todo el rectangulo pero si las lineas deberemos cambiar los siguientes lineas

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Path(){ path in
                path.move(to: CGPoint(x: 30, y: 30))
                path.addLine(to: CGPoint(x: 230, y: 30))
                path.addLine(to: CGPoint(x: 230, y: 150))
                path.addLine(to: CGPoint(x: 30, y: 150))
                //3. Como podemos apreciar nos falta una linea mas para cerrar
                path.closeSubpath() //Es la encargada de cerrar
            }
            //2. cambiaremos .fill por stroke
            /*.fill(.blue)*/
            .stroke(Color.blue, lineWidth: 10)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
