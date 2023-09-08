//
//  SettingsView.swift
//  Forms
//
//  Created by Danilo Andrusco on 06-09-23.
//

//1. AHora necesitamos guardar los datos en la SettingsFactory
import SwiftUI

struct SettingsView: View {
    
    //2. Crearemos la variable
    var settings: SettingsFactory

    @State private var selectedOrder = SortingOrderType.alphabetical
    @State private var showPurchasedOnly = false
    @State private var maxPrice = 5 {
        didSet{
            if maxPrice > 5 {
                maxPrice = 5
            }
            if maxPrice < 1{
                maxPrice = 1
            }
        }
    }
   
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("ORDENAR LOS CURSOS")) {
                    Picker(selection: $selectedOrder, label: Text("Orden de los cursos")){
                        ForEach(SortingOrderType.allCases, id: \.self){ orderType in
                            Text(orderType.description)
                        }
                    }
                }
                Section(header: Text("FILTRAR LOS CURSOS")) {
                    Toggle(isOn: $showPurchasedOnly){
                        Text("Mostrar solo cusos comprados")
                    }
                    Stepper(onIncrement: {
                        maxPrice += 1
                    }, onDecrement: {
                        maxPrice -= 1
                    }){
                        Text("Mostrar \(String(repeating: "$", count: maxPrice)) o menos")
                    }
                }
            }
            .navigationTitle("Configuración")
            .navigationBarItems(leading:
               Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle")
                        .font(.title)
                        .foregroundColor(.red)
                }, trailing:
                Button(action: {
                    //3. Invocamos al settings para que cambie el valor de la variable autocompletada por el valor seleccionado
                settings.order = selectedOrder
                settings.showPurchasedOnly = showPurchasedOnly
                settings.maxPrice = maxPrice
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "externaldrive.badge.checkmark")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            )
        }
        //7. Para que cuando el usuario cuando abra la app se muestren los cambios previamente seleccionado deberemos invocar a este metodo .onAppear
        .onAppear{
            //.8 Aqui indicamos el codigo que debe ejecutarse al iniciar la vista
            selectedOrder = settings.order
            showPurchasedOnly = settings.showPurchasedOnly
            maxPrice = settings.maxPrice
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        //4. Deberemos arreglar esta linea de codigo "SettingsView()" ya que ahora le pasamos el ajustes de SettingsFactory por defecto
        SettingsView(settings: SettingsFactory())
        //5. Lo mismo deberemos cambiar en la ContentView
    }
}
