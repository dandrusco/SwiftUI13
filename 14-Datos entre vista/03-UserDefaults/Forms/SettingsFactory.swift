//
//  SettingsFactory.swift
//  Forms
//
//  Created by Danilo Andrusco on 08-09-23.
//

import Foundation
//2. Crearemos una clase constante
final class SettingsFactory {
    //3. tendra una variable que sera del tipo UserDefaults
    var defaults : UserDefaults
    
    //4. Crearemos el constructor, si le llegan por parametro tomaremos los del UserDefaults y por el contrario los estandares
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        //5. Ahora registraremos los valores por defecto en diccionarios
        defaults.register(defaults: [
            //6. Sera un String donde detallaremos el ajuste, app - vista - configuracon y lo que queramos, nuestro caso es el orden alfabetico que esta en la pocicion 0, si esta comprado como falso y el maximo precio en 5
            "app.view.settings.order" : 0,
            "app.view.settings.showPurchasedOnly" : false,
            "app.view.settings.maxPrice" : 5
        ])
    }
    //7. Guardaremos ahora esos datos en 3 variables autocomputada, partiendo por el order
    var order : SortingOrderType {
        //8. Recuperaremos el valor con get
        get{
            //9. Le devolvemos la preferencia del usuario pasandole el tipo que en este caso es defaults para que nos devulva el valor de tipo entero de la clave en cuestion
            SortingOrderType(type: defaults.integer(forKey: "app.view.settings.order"))
        }
        //10. En caso de cambios en el valor del order, lo guardaremos en las preferencia con set
        set{
            //11. lo guardaremos en el defaults indicandole el valor a guardar pasandoselo en un seter con la palabra newValue quedandonos con el valor en crudo (row) para obtener el numero entero asociado a la clave
            defaults.set(newValue.rawValue, forKey: "app.view.settings.order" )
        }
    }
    //12. Ahora realizaremos los mismo, tanto recuperar como guardar en la variable showPurchasedOnly
    var showPurchasedOnly : Bool {
        get{
            //13. Como aqui no hay que tranformar es mas facil ya que solo le pasamos la clave
            defaults.bool(forKey: "app.view.settings.showPurchasedOnly")
        }
        set{
            //14. Lo mismo para el set, lo obtendremos solo con el newValue
            defaults.set(newValue, forKey: "app.view.settings.showPurchasedOnly")        }
    }
    //15. Y para fibnalizar configuraremos la de maxPrice
    var maxPrice : Int{
        get{
            defaults.integer(forKey: "app.view.settings.maxPrice")
        }
        set{
            defaults.set(newValue, forKey: "app.view.settings.maxPrice")
        }
    }
}
