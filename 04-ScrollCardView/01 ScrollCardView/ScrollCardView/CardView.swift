//
//  CardView.swift
//  ScrollCardView
//
//  Created by Danilo Andrusco on 03-08-23.
//


//2. Tomaremos 4 imagenes que tenemos en la carpeta recursos/miniaturas y las arrastraremos en assets y les cambiaremos el nombre.
import SwiftUI

struct CardView: View {
    var body: some View {
        //3. Crearemos una VStack
        VStack {
            //4. Comenzaremos a poner las imagenes y las redimencionaremos
            Image("swift")
                .resizable()
                .aspectRatio(contentMode: .fit)
            //5. Crearemos una segunda VStack para el titulo alineado a la izquierda
            VStack (alignment: .leading){
                Text("Danilo Andrusco")
                    .font(.headline)
                    .foregroundColor(.secondary)//Secondary es un texto mas transparente (Segundo plano)
                Text("Swift desde cero".uppercased())//uppercased es para poner todo en mayusculas
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(2)//Limitaremos a 2 lineas, si el titulo es mas largo se omitiria
                //6. Al precio lo meteremos en una HStack ya que pondremos el valor actual y el valor de oferta
                HStack {
                    Text("USD 10.99")
                        .font(.subheadline)//Un texto mas pequeño
                    .foregroundColor(.primary)
                     Text("USD 199.9")
                         .font(.caption)//Un texto aun mas pequeño
                     .foregroundColor(.secondary)
                     .strikethrough()//Para tachar el texto
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
