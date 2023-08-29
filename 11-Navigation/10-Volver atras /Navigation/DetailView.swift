//
//  DetailView.swift
//  Navigation
//
//  Created by Danilo Andrusco on 23-08-23.
//

//1. Solo nos falta configurar el boton de volver atras

import SwiftUI

struct DetailView: View {
    
    //2.Crearemos una variable presentationMode con Environment para llamarce por si misma, una variable de entorno
    @Environment(\.presentationMode) var presentationMode
    var course: Course
    
    var body: some View {
        ScrollView {
            VStack {
                Image(course.imagen)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(course.name)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .lineLimit(2)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
        Button(action: {
        //3.Ahora que ya sabemos donde estamos con la variable presentationMode e invocamos al valor empaquetado con dismiss para cerrar la vista actual
        presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "arrow.left.circle.fill")
                .font(.title)
                .foregroundColor(.white)
        })
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: Course(name: "Swift desde cero", imagen: "swift"))
    }
}
