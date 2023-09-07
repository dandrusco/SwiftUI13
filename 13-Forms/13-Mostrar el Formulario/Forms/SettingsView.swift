//
//  SettingsView.swift
//  Forms
//
//  Created by Danilo Andrusco on 06-09-23.
//

import SwiftUI

struct SettingsView: View {
    
    private var sortingOrders = ["Cursos", "Los favoritos", "Comprados"]
    
    @State private var selectedOrder = 0
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
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("ORDENAR LOS CURSOS")) {
                    Picker(selection: $selectedOrder, label: Text("Orden de los cursos")){
                        ForEach(0..<sortingOrders.count, id: \.self){
                            Text(sortingOrders[$0])
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
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
