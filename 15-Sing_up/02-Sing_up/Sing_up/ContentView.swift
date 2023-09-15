//
//  ContentView.swift
//  Sing_up
//
//  Created by Danilo Andrusco on 15-09-23.
//

import SwiftUI

struct ContentView: View {

    @State private var username = ""
    @State private var passwonrd = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack {

            Text("Formulario de registro")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 50)
            //1. Como pueden apreciar ya no necesitaremos estas lineas
            /*Divider()
             
             TextField("Nombre de usuario", text: $username)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.horizontal)
            Divider()

            SecureField("Contraseña", text: $passwonrd)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.horizontal)
            Divider()*/
            
            //2. Ahora ocuparemos la SingleFormView para crear nuevamente los campos
            SingleFormView(fieldname: "Nombre de usuario", fieldValue: $username)
            SingleFormView(fieldname: "Contraseña", fieldValue: $passwonrd, isProtected: true)
            SingleFormView(fieldname: "Confirmar contraseña", fieldValue: $confirmPassword, isProtected: true)
            
            //3. Agregaremos un Spacer()
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SingleFormView: View {
    
    var fieldname = ""
    @Binding var fieldValue: String
    var isProtected = false
    
    var body: some View {
        VStack{
            if isProtected{
                SecureField(fieldname, text: $fieldValue)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.horizontal)
                
            } else {
                TextField(fieldname, text: $fieldValue)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.horizontal)
            }
            Divider()
                .frame(width: 1)
                .background(.gray)
                .padding(.horizontal)
        }
    }
}
