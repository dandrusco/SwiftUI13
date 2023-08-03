//
//  CardView.swift
//  ScrollCardView
//
//  Created by Danilo Andrusco on 03-08-23.
//

import SwiftUI

struct CardView: View {
    //1. Una vez terminada nuestra plantilla, es hora de reutilizar todo el codigo para no tener que copiar y pegar el mismo codigo por cada curso que vayamos incorporando
    //2. Crearemos las variables a utilizar
    
    var imageName: String
    var authorName: String
    var courseTittle: String
    var originalPrice: String
    var discountPrice: String
    
    var body: some View {
        VStack {
            //3. Reemplazamos texto por variable segun corresponda
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack (alignment: .leading){
                    //4. Reemplazamos texto por variable segun corresponda
                    Text(authorName)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    //5. Reemplazamos texto por variable segun corresponda
                    Text(courseTittle.uppercased())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    HStack {
                        //6. Reemplazamos texto por variable segun corresponda
                        Text(originalPrice)
                            .font(.subheadline)
                        .foregroundColor(.primary)
                        //7. Reemplazamos texto por variable segun corresponda
                         Text(discountPrice)
                             .font(.caption)
                         .foregroundColor(.secondary)
                         .strikethrough()
                    }
                }
                .layoutPriority(10)
                Spacer()
            }
            .padding()
        }
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(red: 130/255, green: 130/255, blue: 130/255, opacity: 0.2), lineWidth: 2))
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        //8. En estos momentos nos esta dando un error, esto es devido a que para que el propio Xcode nos muestre una preview de lo que estamos haciendo, la PreviewProvider esta invocando al propio CardView(), por lo tanto deberemos pasarle cada uno de las variables que creamos como argumento
        CardView(imageName: "swift", authorName: "Danilo Andrusco", courseTittle: "Swift desde cero", originalPrice: "USD 199.9", discountPrice: "USD 10.99")
    }
}
