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
            
            SingleFormView(fieldname: "Nombre de usuario", fieldValue: $username)
            //9. Validaremos el numbre de usuario
            ValidationFormView(formText: "Minimo 6 caracteres")
            //10. Le agregaremos un paddinf
                .padding()
            SingleFormView(fieldname: "Contraseña", fieldValue: $passwonrd, isProtected: true)
            //11. En este caso deberemos validar 2 condiciones asi que lo meteremos dentro de una VStack
            VStack{
                ValidationFormView(formText: "Minimo 8 caracteres")
                ValidationFormView(formText: "Una mayuscula y una miniscula")
            }.padding()
            SingleFormView(fieldname: "Confirmar contraseña", fieldValue: $confirmPassword, isProtected: true)
            //12. Crearemos la validacion de confirmacion de clave
            ValidationFormView(formText: "Las dos contraseña deben coincidir")
                .padding()
            //13. Crearemos un padding de 60 puntos para programar mas abajo
                .padding(.bottom, 30)
            
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

//1. Validaremos los campos
struct ValidationFormView: View {
    //2. Crearemos una variable para el nombre del icono
    var iconName = "xmark.circle"
    //3. Crearemos una variable para el color del icono
    var iconColor = Color(red:0.9, green: 0.5, blue: 0.5)
    //4. crearemos una variable para el texto a mostrar
    var formText = ""
    //5. Y por ultimo una variable para ver si las condiciones estan cumplidas, por defecto sera false
    var conditionChecked = false
    
    var body: some View {
        //6. Lo meteremos en un Hstack tanto la imagen como el texto
        HStack {
            Image(systemName: iconName)
                .foregroundStyle(iconColor)//foregroundColor ahora pasa a llamarse foregroundStyle
            Text(formText)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.gray)
            //7. Al propio texto le añadiremos un modificador para tachar en ccaso de que no se cumpla
                .strikethrough(conditionChecked)
            //8. dejaremos un Spacer a continuacion
            Spacer()
        }
    }
}
