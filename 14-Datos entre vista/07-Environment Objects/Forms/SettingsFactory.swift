//
//  SettingsFactory.swift
//  Forms
//
//  Created by Danilo Andrusco on 08-09-23.
//

import Foundation
//1. Para poder refrescar la pantalla principal de acuerdo a los cambios o filtros seleccionado por el usuario deberemos importa Combine
import Combine

//2. A la SettingsFactory deberemos agregarel el protocolo ObservableObject para ver si unas de esas variables ha cambiado su estado
final class SettingsFactory: ObservableObject {

    //3. Deberemos marcar la variable defaults como @Published ya que debera informar al ObservableObject que ha ocurrido un cambio
    @Published var defaults : UserDefaults
    //4. Ahora nos vamos al archivo SettingsView a realizarle algunos cambios
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
            "app.view.settings.order" : 0,
            "app.view.settings.showPurchasedOnly" : false,
            "app.view.settings.maxPrice" : 5
        ])
    }

    var order : SortingOrderType {
        get{
            SortingOrderType(type: defaults.integer(forKey: "app.view.settings.order"))
        }
        set{
            defaults.set(newValue.rawValue, forKey: "app.view.settings.order" )
        }
    }

    var showPurchasedOnly : Bool {
        get{
            defaults.bool(forKey: "app.view.settings.showPurchasedOnly")
        }
        set{
            defaults.set(newValue, forKey: "app.view.settings.showPurchasedOnly")
            
        }
    }
    var maxPrice : Int{
        get{
            defaults.integer(forKey: "app.view.settings.maxPrice")
        }
        set{
            defaults.set(newValue, forKey: "app.view.settings.maxPrice")
        }
    }
}
