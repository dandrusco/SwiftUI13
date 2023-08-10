//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//

//1. Tambien estan las figuras predeterminadas

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Path(){ path in
                path.move(to: CGPoint(x: 60, y: 130))
                path.addQuadCurve(to: CGPoint(x: 200, y: 130), control: CGPoint(x: 130, y: 60))
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
                path.closeSubpath()
            }
            .stroke(Color.red, lineWidth: 10)
            
            Text("Bienvenido")
                .font(.system(.title, design: .rounded))
                .frame(width: 200, height: 50)
                .background(Cartel(percCicle: 0.8).fill(Color.blue))
            
            //2. Crearemos un circulo
            Circle()
                .foregroundColor(.pink)
                .frame(width: 100, height: 100)
                //3. Crearemos ahora un cuadrado
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white))
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Cartel: Shape {

    var percCicle:CGFloat = 1.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: (rect.size.width) * (1-percCicle)/2, y: 0))
        path.addQuadCurve(to: CGPoint(x: (rect.size.width) * (1-(1-percCicle)/2), y: 0), control: CGPoint(x: rect.size.width/2, y: -(rect.size.width*0.4)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        return path
    }
}
