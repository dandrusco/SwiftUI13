//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//

//1. Vamos a reutilizar esta estructura para no tener que escribirla y copiarla a cada rato

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
                //5. deberemos cerrar el trazo
                path.closeSubpath()
            }
            .stroke(Color.red, lineWidth: 10)
            
            //13. Crearemos un texto donde en el backgrond le pasaremos el cartel con el porcentaje de curva que queremos buscar y con un color
            Text("Bienvenido")
                .font(.system(.title, design: .rounded))
                .frame(width: 200, height: 50)
                .background(Cartel(percCicle: 0.8).fill(Color.blue))
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//2. Crearemos la estructura aqui que implemente el protolo Shape:
struct Cartel: Shape {
    //6. Crearemos una variable para ver el pocentaje de curvatura que quiera el usuario
    var percCicle:CGFloat = 1.0
    
    //3. le pasamos un rectangulo para que lo dibuje
    func path(in rect: CGRect) -> Path {
        //4. Crearemos una varible path para ser devuelta
        var path = Path()
        
        //7. Copiaremos las tres lineas que dibujan el carpel y las popiaremos aqui:
        //8. Adaptaremos las cordenadas absoluta por relativas
        //9. Partiremos en las cordenanas que le pase el,usuario * percCicle /2 para darle la separacion y la Y em 0
        path.move(to: CGPoint(x: (rect.size.width) * (1-percCicle)/2, y: 0))
        //10. Cambiaremos las coordenadas que el usuario debera pasarle por paramentos en x * percCicle /2 y la y en 0
        //11. El control lo dejaremos a la mitad y la y la estiraremos hacia arriba (40% por arriba de la altura)
        path.addQuadCurve(to: CGPoint(x: (rect.size.width) * (1-(1-percCicle)/2), y: 0), control: CGPoint(x: rect.size.width/2, y: -(rect.size.width*0.4)))
        //12. Lo pintaremos 0, 0 hasta la anchura y altura
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        
        //5. devolvemos el path
        return path
    }
}
