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
            //1. Eliminaremos todos los botenes creados, menos el ultimo y lo copiaremso y pegaremos 2 veces.
            
            Button(action: {
                //2. Modificaremos la accion para editar
                print("Boton editar pulsado")
            }){
                HStack {
                    //3. Cambiamos su icono
                    Image(systemName:"square.and.pencil")
                    //4. Cambiamos el texto
                    Text("Editar")
                        .fontWeight(.bold)
                }
                //11. Ahora ponemos eliminar toda esta configuracion:
                /*.frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(colors: [Color("Dark Ocean"), Color("Dark Ocean 2")], startPoint: .top, endPoint: .bottom))
                .font(.largeTitle)
                .foregroundColor(.white)
                .cornerRadius(40)
                .shadow(color: .blue, radius: 10.0)
                .padding(.horizontal, 20)*/
            }//12. Ahora llamamos al modificador buttonStyle agregandole el EstiloDeBotones() creado en el punto 10
            .buttonStyle(EstiloDeBotones())
            
            Button(action: {
                print("Boton papelera pulsado")
            }){
                HStack {
                    Image(systemName:"trash")
                    Text("Eliminar")
                        .fontWeight(.bold)
                }
                //13. Hacemos lo mismo en el boton eliminar
                /*.frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(colors: [Color("Dark Ocean"), Color("Dark Ocean 2")], startPoint: .top, endPoint: .bottom))
                .font(.largeTitle)
                .foregroundColor(.white)
                .cornerRadius(40)
                .shadow(color: .blue, radius: 10.0)
                .padding(.horizontal, 20)*/
            }.buttonStyle(EstiloDeBotones())
            
            Button(action: {
                //5. Cambamos accison por compartir
                print("Boton compartir pulsado")
            }){
                HStack {
                    //6. Cambiamos su icono
                    Image(systemName:"square.and.arrow.up")
                    //7. Cambiamos su texto
                    Text("Compartir")
                        .fontWeight(.bold)
                }
                //14. Lo mismo aqui
                /*.frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(colors: [Color("Dark Ocean"), Color("Dark Ocean 2")], startPoint: .top, endPoint: .bottom))
                .font(.largeTitle)
                .foregroundColor(.white)
                .cornerRadius(40)
                .shadow(color: .blue, radius: 10.0)
                .padding(.horizontal, 20)*/
            }.buttonStyle(EstiloDeBotones())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//8. Como pueden apreciar la tecnica de copiar y pegar no es bien vista, ya que si ahora queremos cambiar el azul por el naranjo deberemos modificarlo en los 3 botones, para ello utilizaremos un Estilo de botones que nos proporciona Swift
struct EstiloDeBotones: ButtonStyle {
    //9. Deberemos crear una funcion makeBody
    func makeBody(configuration: Configuration) -> some View {
        //10. Ahora escribiremos: configuration.label y le pegaremos todo el estilo que creamos en los botones de arriba (desde el frame hacia abajo)
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
        //15. AHora podemos cambiar el Color("Dark Ocean") por Color.red y vemos que se cambia en cada uno de los botones
            .background(LinearGradient(colors: [Color.red, Color("Dark Ocean 2")], startPoint: .top, endPoint: .bottom))
            .font(.largeTitle)
            .foregroundColor(.white)
            .cornerRadius(40)
            .shadow(color: .blue, radius: 10.0)
            .padding(.horizontal, 20)
    }
}
