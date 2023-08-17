//
//  LoadingView.swift
//  anims
//
//  Created by Danilo Andrusco on 17-08-23.
//

//2. Para que el compilador nos tome esta preview deberemos pasarsela al AnimsApp 
import SwiftUI

struct LoadingView: View {
    
    //8. Crearemos una variable para ver su carga, en principio sera falsa
    @State private var isLoading = false
    
    var body: some View {
        //4. Crearemos un circulo para crear un indicador de carga
        Circle()
            //5. Lo cortaremos del 0 al 75%
            .trim(from: 0.0, to: 0.75)
            //6. Le quitamos el fondo y le cambiaremos el color y la linea
            .stroke(Color.green, lineWidth: 8)
            //7. Cambiaremos su tamaño
            .frame(width: 150, height: 150)
            //9. Lo rotaremos de 0 a 360 utilizando la cariable boleana isLoading
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            //10. Crearemos una animacion que se repita indeterminables veces
            //.animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: 1.5)
            .animation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false), value: isLoading)
            //11. Ahora pondremos cuando cambiar el isLoading de false a true
            .onAppear(){
                isLoading = true
            }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
