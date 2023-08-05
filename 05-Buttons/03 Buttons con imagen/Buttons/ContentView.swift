//
//  ContentView.swift
//  Buttons
//
//  Created by Danilo Andrusco on 04-08-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //1. Eliminaremos todos los botenes creados, menos el ultimo (el redondeado) y lo llamaremos Hola Mundo
        
            Button(action: {
                print("Boton Hola Mundo pulsado")
            }) {
                Text("Hola Mundo")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .cornerRadius(50)
                    .padding(12)
                    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.orange, lineWidth: 5))
            }
            //2. Crearemos un nuevo boton redondeado pero con una imagen de un basurero
            Button(action: {
                print("Boton papelera pulsado")
            }){
                Image(systemName:"trash")
                    .padding()
                    .background(Color.red)
                    .clipShape(Circle())//Boton redondeado
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            
            //3. Modificaremos el boton del basurero agregandole texto
            Button(action: {
                print("Boton papelera pulsado")
            }){
                //Meteremos solo la imagen en un HStack
                HStack {
                    Image(systemName:"trash")
                    //Agregamos el texo
                    Text("Eliminar")
                        .fontWeight(.bold)
                }
                //Edentamos a la izquierda
                .padding()
                .background(Color.red)
                //Eliminaremos el clipShape
                /*.clipShape(Circle())*/
                .font(.largeTitle)
                .foregroundColor(.white)
                //Le agregaremos un borde
                .cornerRadius(40)
                
            }
            //4. Ahora crearemos un boton con gradiente
            Button(action: {
                print("Boton papelera pulsado")
            }){
                HStack {
                    Image(systemName:"trash")
                    Text("Eliminar")
                        .fontWeight(.bold)
                }
                .padding()
                //Modificaremso el Color.red por LinearGradient()
                .background(LinearGradient(colors: [Color.pink, Color.orange], startPoint: .top, endPoint: .bottom))
                .font(.largeTitle)
                .foregroundColor(.white)
                .cornerRadius(40)
            }
            //5. Para crear nuevos color nos deberemos ir hasta Assets (donde se adjuntan las imagenes) le damos boton derecho y seleccionamos New Color Set, tenremos que crear para el modo claro y modo oscuro, en el inspector le podemos poner el color en hezadecimal y su nombre (Crearemos 2)
            Button(action: {
                print("Boton papelera pulsado")
            }){
                HStack {
                    Image(systemName:"trash")
                    Text("Eliminar")
                        .fontWeight(.bold)
                }
                .padding()
                //Modificaremso los colores de la LinearGradient() por los creados por nosotros
                .background(LinearGradient(colors: [Color("Dark Ocean"), Color("Dark Ocean 2")], startPoint: .top, endPoint: .bottom))
                .font(.largeTitle)
                .foregroundColor(.white)
                .cornerRadius(40)
                //6. Tambien le podemos poner sombras y su color
                .shadow(color: .blue, radius: 10.0)
            }
            
            //7. Tomando el ejemplo anterior ahora lo modificaremos para que ocupe todo el ancho de la pantlla
            Button(action: {
                print("Boton papelera pulsado")
            }){
                HStack {
                    Image(systemName:"trash")
                    Text("Eliminar")
                        .fontWeight(.bold)
                }
                //8. Crearemos un frame:
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(colors: [Color("Dark Ocean"), Color("Dark Ocean 2")], startPoint: .top, endPoint: .bottom))
                .font(.largeTitle)
                .foregroundColor(.white)
                .cornerRadius(40)
                .shadow(color: .blue, radius: 10.0)
                //9. Si lo encontramos muy ancho podemos utilizar el padding
                .padding(.horizontal, 20)
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
