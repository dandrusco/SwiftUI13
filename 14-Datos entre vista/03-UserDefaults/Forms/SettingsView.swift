//
//  SettingsView.swift
//  Forms
//
//  Created by Danilo Andrusco on 06-09-23.
//


//1. Hasta el momento nuestra App no es capaz de guardar las preferencias del usuario, si cerramos la app y la volvemos a arrancar veremos que los cambios se pierden, para ello crearemos un nuevo fichero de tipo Swift File que llamaremos SettingsFactory
import SwiftUI

struct SettingsView: View {

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
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "externaldrive.badge.checkmark")
                        .font(.title)
                        .foregroundColor(.blue)
                })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
