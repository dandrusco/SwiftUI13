//
//  ContentView.swift
//  list
//
//  Created by Danilo Andrusco on 21-08-23.
//


//1. Nos iremos a la carpeta 04-ScrollCardView/01 ScrollCardView/ScrollCardView/Assets.xcassets y copiaremos las 3 carpeteas (hackPython.imageset - interfazPython.imageset - python.imageset y swift.imageset)
//2. las pegaremos en la ruta: 10-List/05-Crear propios datos/list/Assets.xcassets

import SwiftUI

struct ContentView: View {
    //3. Crearemos 2 arrais, una para los nombres de los cursos y la otra para los nombre de las imagenes (deben tener la misma cantidad)
    var courseName = ["Swift desde cero",
                      "Python de cero a experto",
                      "Interfaz grafica en Python",
                      "Hacking con Python"]
    
    var courseImage = ["swift",
                       "python",
                       "interfazPython",
                       "hackPython"]
    
    var body: some View {
        VStack {
            //4.Deberemos crear una lista y recorrer los indices de los nombre de los cursos
            List(courseName.indices, id: \.self) { index in
                //5. Pondremos las imagenes y texto dentro de un HStack
                HStack {
                    //6. LLamaremos a las imagenes por su indice
                    Image(courseImage[index])
                    //7. Deberemos redimencionarlas
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipped()
                        .cornerRadius(30)
                    //8. LLamaremos a los nombres de los cursos por su indice
                    Text(courseName[index])
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
