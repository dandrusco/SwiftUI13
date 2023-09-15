//
//  ContentView.swift
//  Sing_up
//
//  Created by Danilo Andrusco on 15-09-23.
//

import SwiftUI

struct ContentView: View {
    //1. Crearemos un formulario de registro, para ello deberemos crear tres variables de estado
    @State private var username = ""
    @State private var passwonrd = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack {
            //2. Este Text lo dejaremos como el titulo y le popdremos un Divider() entre formulario
            Text("Formulario de registro")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 50)
            Divider()
            //3. Agregaremos un TextField para que el usuario indique su nombre de usuario y una variable donde se almacenara
            TextField("Nombre de usuario", text: $username)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.horizontal)
            Divider()
            //4. Para las contraseñas lo realizaremos con el SecureField
            SecureField("Contraseña", text: $passwonrd)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding(.horizontal)
            Divider()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//5. Crearemos una estructura para la vista del formulario
struct SingleFormView: View {
    
    //6.Crearemos una variable para el campo a mostrar al usuario y un link para la variable a almacenar dicho dato
    var fieldname = ""
    @Binding var fieldValue: String
    
    //7. Crearemos la variable para ver si esta protegida, en principio false
    var isProtected = false
    
    //8. Todas las vistas deben tener una variable llamada body de tipo some View
    var body: some View {
        //9. Resumiremos la informacion del SingleFormView en realcion si esta o no protegida
        VStack{
            if isProtected{
                //10. Si esta protegida copiaremos los mismos datos del punto 4 pero modificaremos la "Contraseña" y el $passwonrd por los creados en el punto 7
                SecureField(fieldname, text: $fieldValue)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.horizontal)
                
            } else {
                //11. en el caso de que la entreda no este protegida, tomaremos los datos del punto 3, modificando el "Nombre de usuario" y $username por los creados en el punto 7
                TextField(fieldname, text: $fieldValue)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.horizontal)
            }
            //12. Pondremos un Divider y lo configuraremos
            Divider()
                .frame(width: 1)
                .background(.gray)
                .padding(.horizontal)
        }
    }
}
