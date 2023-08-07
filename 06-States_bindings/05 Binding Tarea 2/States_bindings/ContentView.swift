//
//  ContentView.swift
//  States_bindings
//
//  Created by Danilo Andrusco on 06-08-23.
//

//1. Crearemos 3 botones que sumen de manera independiente

import SwiftUI

struct ContentView: View {
    //3. deberemos copiar este @State y pegarlo en la VistaContador
    @State private var numClic = 0
    
    var body: some View {
        VStack {
            //2. Le hacemos clic con coman a Button y seleccionaremos Extraer Subview que la llamaremos como vistacontador
            //5. ahora a la VistaContador le deberemos pasar dos variables, la numClik que corresponde a una variable Bindeada (Binding<Int>) que se marca con un signo dolar y el color del boton
            VistaContador(numClic: $numClic, buttonColor: .purple)//Bindeada significa quien invoca a la VistaContador debe proporcionar un link (Binding), de esta manera es la ContentView quien invoca a la VistaContador y le proporciona el estado ($numClic) a traves de una variable bindeada (@Binding var numClic: Int)
            //5.1 Basicamente lo que hicimos es crear una conexion bidireccional entre el numClic del la ContentView (el padre) con el numClic de la VistaContador (el hijo)
            //6. El signo dolar $ se utiliza como operador para obtener el Biding de una variable State (para pasarle el link)
            //7. Ahora copiaremos y pegaremos 2 veces el VistaContador(numClic: $numClic, buttonColor: .purple) cambiandole los parametros
            VistaContador(numClic: $numClic, buttonColor: .yellow)
            VistaContador(numClic: $numClic, buttonColor: .green)
            //8. Si ahora le hacemos click a cualquiera de los botones estos incrementaran todos 
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct VistaContador: View {
    
    //3.1 Lo pegamos aqui pero no sera privada, le cambiaremos el @State por @Binding y la declareremos de tipo Int
    @Binding var numClic: Int
    
    //4. Como debemos cambiar el color de los botones crearemos una variable
    var buttonColor: Color
    
    var body: some View {
        Button(action: {
            numClic += 1
        }) {
            Circle()
                .frame(width: 150, height: 150)
                //4.1 le cambiamos el .purple por la variabñe buttonColor
                .foregroundColor(buttonColor)
                .overlay(Text("\(numClic)")
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(.white))
        }
    }
}
