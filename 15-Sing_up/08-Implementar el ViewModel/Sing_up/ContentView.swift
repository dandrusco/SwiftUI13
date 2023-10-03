//
//  ContentView.swift
//  Sing_up
//
//  Created by Danilo Andrusco on 15-09-23.
//


import SwiftUI

struct ContentView: View {
    
    //5. Ya no nos sirven estas dos variables
    /*@State private var passwonrd = ""
    @State private var confirmPassword = ""*/
    
    @ObservedObject private var registrationVM = RegistrationViewModel()
    
    var body: some View {
        VStack {

            Text("Formulario de registro")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 50)
            
            SingleFormView(fieldname: "Nombre de usuario", fieldValue: $registrationVM.userName)
            ValidationFormView(
                iconName: registrationVM.usernameLengthValid ? "checkmark.circle" : "xmark.circle",
                iconColor: registrationVM.usernameLengthValid ? Color.green : Color.red,
                formText: "Minimo 6 caracteres",
                conditionChecked: registrationVM.usernameLengthValid)
                .padding()
            //6. Modificaremos estas lineas quedando asi:
            /*SingleFormView(fieldname: "Contraseña", fieldValue: $passwonrd, isProtected: true)
            VStack{
                ValidationFormView(formText: "Minimo 8 caracteres")
                ValidationFormView(formText: "Una mayuscula y una miniscula")
            }.padding()*/
            SingleFormView(fieldname: "Contraseña", fieldValue: $registrationVM.password, isProtected: true)
            VStack{
                ValidationFormView(
                    iconName: registrationVM.passwordLengthValid ? "checkmark.circle" : "xmark.circle",
                    iconColor: registrationVM.passwordLengthValid ? Color.green : Color.red,
                    formText: "Minimo 8 caracteres",
                    conditionChecked: registrationVM.passwordLengthValid)
                ValidationFormView(
                    iconName: registrationVM.passwordCapitalLetter ? "checkmark.circle" : "xmark.circle",
                    iconColor: registrationVM.passwordCapitalLetter ? Color.green : Color.red,
                    formText: "Una mayuscula y una miniscula",
                    conditionChecked: registrationVM.passwordCapitalLetter)
            }.padding()
            //7. Ahora modificaremos estas lineas:
            /*SingleFormView(fieldname: "Confirmar contraseña", fieldValue: $confirmPassword, isProtected: true)
            ValidationFormView(formText: "Las dos contraseña deben coincidir")*/
            SingleFormView(fieldname: "Confirmar contraseña", fieldValue: $registrationVM.confirmPassword, isProtected: true)
            ValidationFormView(
                iconName: registrationVM.passwordMatch ? "checkmark.circle" : "xmark.circle",
                iconColor: registrationVM.passwordMatch ? Color.green : Color.red,
                formText: "Las dos contraseña deben coincidir",
                conditionChecked: registrationVM.passwordMatch)
                .padding()
                .padding(.bottom, 30)
            
            Button(action: {
                //Accion a realizar
            }){
                Text("Registrame")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .top, endPoint: .bottom))
            }

            HStack{
                Text("¿Ya tienes una cuenta?")
                    .font(.system(.body, design: .rounded))
                    .bold()
                Button(action: {
                    //Entramos en el login
                }){
                    Text("Entrar ahora")
                        .font(.system(.headline))
                        .foregroundStyle(.green)
                }
            }.padding()
            
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

struct ValidationFormView: View {
   
    var iconName = "xmark.circle"
    var iconColor = Color(red:0.9, green: 0.5, blue: 0.5)
    var formText = ""
    var conditionChecked = false
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundStyle(iconColor)//foregroundColor ahora pasa a llamarse foregroundStyle
            Text(formText)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.gray)
                .strikethrough(conditionChecked)
            
            Spacer()
        }
    }
}
