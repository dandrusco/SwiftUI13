//
//  SettingsView.swift
//  Forms
//
//  Created by Danilo Andrusco on 06-09-23.
//

import SwiftUI

struct SettingsView: View {

    //1. Ahora que tenemos nuestro SortingOrderTyte creado, podemos presindir de esta linea de codigo:
    /*private var sortingOrders = ["Cursos", "Los favoritos", "Comprados"]*/
    
    //2. Ahora en vez de que el selectedOrder = 0 sera SortingOrderType.alphabetical
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
                        //3. El ForEach(0..<sortingOrders.count, id: \.self){ pasara a cambiar, agregando el SortingOrderType y nos quedaremos con todos los casos .allCases para luego pasarselo a una variable que llamaremos orderType
                        ForEach(SortingOrderType.allCases, id: \.self){ orderType in
                            //4. Y el Text(sortingOrders[$0]) ahora le pasaremos la variable orderType pero con la descripcion creada en el SortingOrderTyte
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
