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
        .overlay(
            HStack{
                //1. Utilizaremos el Spacer() para tirarlo a la derecha
                Spacer()
                //2. AHora encerraremos todo entro de un VStack
                VStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.down.circle")
                            .font(.largeTitle)
                            //4. Ahora le podemos cambiar el color negro por el blanco
                            .foregroundColor(.white)
                    })
                    .padding(.trailing, 20)
                    .padding(.top, 5)
                    
                    //3. Y ahora le damos otro Spacer para tirarlo hacia arriba
                    Spacer()
                }
            }
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: Course(name: "Swift desde cero", imagen: "swift"))
    }
}
