//
//  RegistrationViewModel.swift
//  Sing_up
//
//  Created by Danilo Andrusco on 21-09-23.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject {
    
    //Entrada de datos del usuario
    @Published var userName = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    //Valores de validacion del formulario
    @Published var usernameLengthValid = false
    @Published var passwordLengthValid = false
    @Published var passwordCapitalLetter = false
    @Published var passwordMatch = false
    
    init(){
        //1. En el init debemos estar escuchando por si ocurren cambios en el userName a traves de una serie de eventos .receive, en el hilo principal de ejecucion RunLoop.main. Todo esto deberemos mapearlo (transformar) a un balor booleano de tipo verdadero en el caso de que contenga mas de 6 caracteres
        $userName.receive(on: RunLoop.main).map{
            userName in
            return userName.count >= 6
        }
        //2. Ahora deberemos asignarselo a la variable usernameLengthValid en la misma clase (self)
        .assign(to: \.usernameLengthValid, on: self)
        //3. Con ento logramos conectar el @Published de userName con el @Published de usernameLengthValid, osea por cada cambio refrlejado en el userName se vera reflejado en el usernameLengthValid
        //4. Conbine puede tener dos tipos de suscriptores, los que reciben eventos como el este caso el de $userName.receive y los que pueden actualizar una propiedad en un objeto como es el caso del .assign quien asigna un valor
        //5. Ahora regresaremos a la ContenctView
    }
}
