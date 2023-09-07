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
    //1. Crearemos un Steppers para poder elegir valores, para ello crearemos un State con el valor maximo del curso y le implementaremos un metodo adicional didSet para comprobar el valor
    @State private var maxPrice = 5 {
        didSet{
            //2. Si el usuario le da mas de 5, el valor no subira de 5
            if maxPrice > 5 {
                maxPrice = 5
            }
            //3. Por el contrario si el usuario le da menos de 1, el valor no bajara mas de 1
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
                    //4. Ahora pondremos el Steppers
                    Stepper(onIncrement: {
                        //5. Incrementamos en 1
                        maxPrice += 1
                    }, onDecrement: {
                        maxPrice -= 1
                    }){
                        //6. Configuramos lo que queremos mostrar
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
