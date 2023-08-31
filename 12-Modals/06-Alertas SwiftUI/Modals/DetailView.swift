//
//  DetailView.swift
//  Navigation
//
//  Created by Danilo Andrusco on 23-08-23.
//



import SwiftUI

struct DetailView: View {
    
    //3. Crearemos una variable de estado para la alerta
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
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack{
                Spacer()
                VStack {
                    Button(action: {
                        //1. En vez de que el boton cierre, crearemos una alerta al usuario
                        //2. Eliminamos esta linea
                        /*presentationMode.wrappedValue.dismiss()*/
                        
                        //6. cambiamos el valor de showAlertView a verdadero
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
        )
        //4. Le indicamos que debe mostrar una alerta cuando showAlertView sea verdadero
        .alert(isPresented: $showAlertView){
            //5. Crearmos la alerta con su accion, defaul para aceptar accionando el cierre y con cancelar nos quedamos donde estamos
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
