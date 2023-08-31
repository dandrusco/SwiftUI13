//
//  DetailView.swift
//  Navigation
//
//  Created by Danilo Andrusco on 23-08-23.
//

import SwiftUI

struct DetailView: View {
    
    @State private var showAlertView = false
    
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
                
                //5. Añidaremos la descriocion
                Text(course.description)
                    .font(.system(.body, design: .rounded))
                    .padding()
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack{
                Spacer()
                VStack {
                    Button(action: {
                        showAlertView = true
                    }, label: {
                        Image(systemName: "chevron.down.circle")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    })
                    .padding(.trailing, 20)
                    .padding(.top, 5)
                    
                    Spacer()
                }
            }
        ).alert(isPresented: $showAlertView){
            Alert(title: Text("Alerte!"),
                  message: Text("Estas seguro de cerrar la ventana?"),
                  primaryButton: .default(Text("Si"), action: {presentationMode.wrappedValue.dismiss()}),
                  secondaryButton: .cancel(Text("No")))
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: Course(name: "Swift desde cero", imagen: "swift"))
    }
}
