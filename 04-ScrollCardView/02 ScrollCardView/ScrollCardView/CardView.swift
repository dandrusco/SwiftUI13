//
//  CardView.swift
//  ScrollCardView
//
//  Created by Danilo Andrusco on 03-08-23.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            Image("swift")
                .resizable()
                .aspectRatio(contentMode: .fit)
            //1. Le daremos mas espacio a nuestro curso, pondremos una HStack a este VStack
            HStack {
                VStack (alignment: .leading){
                    Text("Danilo Andrusco")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text("Swift desde cero".uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    HStack {
                        Text("USD 10.99")
                            .font(.subheadline)
                        .foregroundColor(.primary)
                         Text("USD 199.9")
                             .font(.caption)
                         .foregroundColor(.secondary)
                         .strikethrough()
                    }
                }//3. EN algunos casos poner un Spacer puede hacer que el texto no quede bien alineado, para ello le podemos dar mas prioridad al Stack que al Spacer
                .layoutPriority(10)//Mientras mas alto el numero (100) mas prioidad tendra
                //2. Ahora tiraremos todo el texto a la izquierda con Spacer()
                Spacer()
            }//4. Agregaremos un padding para que no quede pegado el texto a la imagen ni a los bordes
            .padding()
        }//5. Cerraremos toda la targeta dandole un borde redondeado
        .cornerRadius(12)
        //6. Pintaremos el borde de color gris con una opacidad del 20%, con anchura 2
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 130/255, green: 130/255, blue: 130/255, opacity: 0.2), lineWidth: 2))//Con stroke eliminamos el fondo para que solo nos quede la linea
        //7. Crearemos un padding doble tanto para arriba como para los lados
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
