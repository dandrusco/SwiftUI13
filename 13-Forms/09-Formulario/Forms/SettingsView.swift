//
//  SettingsView.swift
//  Forms
//
//  Created by Danilo Andrusco on 06-09-23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        //3. Crearemos una NavigationView para ir adelante o atras en la pantalla de ajuste
        NavigationView{
            //2. Crearemos un formulario
            Form {
                //4. Para dividir el formulario en varias partes, en Swift se le llama Section, cada section tendra una cabecera
                Section(header: Text("ORDENAR LOS CURSOS")) {
                    //5. Este es el cuerpo de la seccion
                    Text("Mostrar formar de ordenar")
                }
                //6. Crearemos mas secciones
                Section(header: Text("FILTRAR LOS CURSOS")) {
                    Text("Filtros")
                }
            }//7. Crearemos el titulo
            .navigationTitle("Configuración")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
