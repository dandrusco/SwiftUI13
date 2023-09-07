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
    //1. Crearemos un boton Toggle, para ello crearemos un State de tipo booleano
    @State private var showPurchasedOnly = false
    
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
                    //2. Eliminamos el Text
                    /*Text("Filtros")*/
                    //3. Creamos el Toggle
                    Toggle(isOn: $showPurchasedOnly){
                        Text("Mostrar solo cusos comprados")
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
