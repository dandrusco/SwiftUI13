//
//  RegistrationViewModel.swift
//  Sing_up
//
//  Created by Danilo Andrusco on 21-09-23.
//

import Foundation
//7. Dejaremos listo la importacion de Combine
import Combine

//3. Crearemos una clase que debera implementar el protocolo de ObservableObject para utilizar el @Published
class RegistrationViewModel: ObservableObject {
    //4. Deberemos crear nuevamente nuestras 3 variables pero debera ser @Published, que sera nuestra entrada de datos del usuario
    @Published var userName = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    //5. Programaremos los valores de validacion del formulario que esta clase nos devolvera, en principio todo en falso
    @Published var usernameLengthValid = false
    @Published var passwordLengthValid = false
    @Published var passwordCapitalLetter = false
    @Published var passwordMatch = false
    
    //6. Deberemos crear el contructor
    init(){
        
    }
}
