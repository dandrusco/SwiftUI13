//
//  DetailView.swift
//  Navigation
//
//  Created by Danilo Andrusco on 23-08-23.
//

import SwiftUI

struct DetailView: View {
    
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
        //1. Como no tenemos barra podemos eliminar todas estas linea
        /*.navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "arrow.left.circle.fill")
                .font(.title)
                .foregroundColor(.white)
        })
        )*/
        
        //2. Crearemos el boton dentro de un overlay con un HStack
        .overlay(
            HStack{
                Button(action: {
                    //3. Creamos la accion del boton que seria para cerrarlo
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    //4. Creamos el boton de font de titulo largo y de  color negro
                    Image(systemName: "chevron.down.circle")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                })
                //5. Crearemos 2 pading, el primero como .trailing (la derecha) y con 20 puntos
                .padding(.trailing, 20)
                //6. Y el otro como .top de 5 puntos
                .padding(.top, 5)
            }
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: Course(name: "Swift desde cero", imagen: "swift"))
    }
}
