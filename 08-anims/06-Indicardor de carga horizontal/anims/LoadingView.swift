//
//  LoadingView.swift
//  anims
//
//  Created by Danilo Andrusco on 17-08-23.
//

//1. Crearemos una carga horizontal
import SwiftUI

struct LoadingView: View {
    
    //5. Creamos la variable para la carga en principio falso
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("Cargando")
                .font(.system(.title, design: .rounded))
                .bold()
                //2. Con Offset en -30 lo tiraremos un poco hacia arriba
                .offset(x:0, y:-30)
            
            //3. Crearemos la linea de carga
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color(.systemGray6), lineWidth: 5)
                .frame(width: 300, height: 4)
            
            //4. Crearemos el que ira por encima cargando
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 50, height: 4)
            //5. Creamos el offset para la animacion donde en caso de ser falso estara en el -125 y en el caso de estar en true pasara a 125
                .offset(x: isLoading ? 125 : -125, y:0)
            
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: isLoading)
                .onAppear(){
                    isLoading = true
                }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
