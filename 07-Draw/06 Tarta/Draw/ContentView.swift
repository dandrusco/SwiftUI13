//
//  ContentView.swift
//  Draw
//
//  Created by Danilo Andrusco on 07-08-23.
//

//1. Crearemos un diagrama de tarta

import SwiftUI

struct ContentView: View {
    var body: some View {
        //2. Cambiaremos el VStack por un ZStac para apilar
        ZStack {
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            startAngle: Angle(degrees: 0),
                            //4. El angulo lo cambiaremos a 200
                            endAngle: Angle(degrees: 200),
                            clockwise: true)
            }//3. Cambairemos el color .yellow por un color de sistema
            .fill(Color(.systemBlue))
            
            //5. Ahora popiamos todo el codigo anterior y lo pegamos acontinuacion:
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            //6. deberemos contunuar en donde termino el arco anterior
                            startAngle: Angle(degrees: 200),
                            //7. Cambiamos donde terminara
                            endAngle: Angle(degrees: 160),
                            clockwise: true)
            }
            //8. Cambiamos el color
            .fill(Color(.systemPink))
            
            //9. creamos otro mas:
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            //10. deberemos contunuar en donde termino el arco anterior
                            startAngle: Angle(degrees: 160),
                            //11. Cambiamos donde terminara
                            endAngle: Angle(degrees: 110),
                            clockwise: true)
            }
            //12. Cambiamos el color
            .fill(Color(.systemIndigo))
            
            //13. creamos otro mas:
            Path(){ path in
                path.move(to: CGPoint(x: 200, y: 250))
                path.addArc(center: CGPoint(x: 200, y: 250),
                            radius: 160,
                            //14. deberemos contunuar en donde termino el arco anterior
                            startAngle: Angle(degrees: 110),
                            //15. Cambiamos donde terminara
                            endAngle: Angle(degrees: 0),
                            clockwise: true)
            }
            //16. Cambiamos el color
            .fill(Color(.systemTeal))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
