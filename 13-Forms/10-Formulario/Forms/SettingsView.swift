//
//  SettingsView.swift
//  Forms
//
//  Created by Danilo Andrusco on 06-09-23.
//

import SwiftUI

struct SettingsView: View {
    
    //1. Crearemos un Array para ordenar segun lo decee el usuario
    private var sortingOrders = ["Cursos", "Los favoritos", "Comprados"]
    //2. Ahora necesitmos un estado para ver en ue opcion me encuentro
    @State private var selectedOrder = 0
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("ORDENAR LOS CURSOS")) {
                    //3. Reemplazaremos el texto por un selector (Picker)
                    /*Text("Mostrar formar de ordenar")*/
                    Picker(selection: $selectedOrder, label: Text("Orden de los cursos")){
                        //Crearemos un bucle para mostrar
                        ForEach(0..<sortingOrders.count, id: \.self){
                            Text(sortingOrders[$0])
                        }
                    }
                }
                Section(header: Text("FILTRAR LOS CURSOS")) {
                    Text("Filtros")
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
