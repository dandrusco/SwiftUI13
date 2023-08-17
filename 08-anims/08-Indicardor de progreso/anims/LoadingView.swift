//
//  LoadingView.swift
//  anims
//
//  Created by Danilo Andrusco on 17-08-23.
//

//1. Crearemos un indicador de progreso
import SwiftUI

struct LoadingView: View {
    
    //2. Creamos una variable de tipo CGFloat igual al 0% al inicio
    @State private var progress : CGFloat = 0.0
    
    var body: some View {
        //3. Lo creamos en un ZStack
        ZStack {
            //4. Creamos un texto con el indicador multiplicado por 100
            Text("\(Int(progress*100)) %")
                .font(.system(.title, design: .rounded))
                .bold()
            
            //5. Creamos el circulo
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 12)
                .frame(width: 150, height: 150)
            
            //6. Creamos el circulo de carga
            Circle()
                //7. Partira del 0 hasta el progress
                .trim(from: 0.0, to: progress)
                .stroke(Color.green, lineWidth: 12)
                .frame(width: 150, height: 150)
                //8. El efecto de rotacion sera en sentido contrario a las ahujas del reloj
                .rotationEffect(Angle(degrees: -90))
                /*.animation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false), value: isLoading)
                .onAppear(){
                    isLoading = true
                }*/
        }//9. Crearemos un OnAppear() para que comience a ejecutarse a penas arranque
        .onAppear() {
            //10.Con Timer incrementaremos el valor con un intervalo de 0.01 segundo (1%)
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                progress += 0.01
                //11. Si supera el 100% detenemos el Timer
                if progress >= 1.0 {
                    timer.invalidate()
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
