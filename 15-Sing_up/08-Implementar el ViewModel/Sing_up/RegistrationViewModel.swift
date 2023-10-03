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
    
    //1. Como podemos apreciar aun tenemos 4 errores en amarillo, lo que ocurre es que cada vez que tenemos un suscriptor este es asignado pero nunca es usado
    //2. Para que no este todo el tiempo esperando a que esta este usandose deberemos crear objetos cancelables pasandole un confunto cancelable inicializando el conjunto a vacio
    private var cancelableObjects: Set<AnyCancellable> = []
    
    init(){
        $userName.receive(on: RunLoop.main).map{
            userName in
            return userName.count >= 6
        }
        .assign(to: \.usernameLengthValid, on: self)
        //3. Ahora lo almacenamos y deberemos repetir lo mismo en las otras 3 advertencia (debajo de cada .assign)
        .store(in: &cancelableObjects)
        
        $password.receive(on: RunLoop.main).map{
            password in
            return password.count >= 8
        }
        .assign(to: \.passwordLengthValid, on: self)
        .store(in: &cancelableObjects)
        
        $password.receive(on: RunLoop.main).map{
            password in
            let pattern = "[A-Z]"
    
            if let _ = password.range(of: pattern, options: .regularExpression){
                return true
            }else{
                return false
            }
        }
        .assign(to: \.passwordCapitalLetter, on: self)
        .store(in: &cancelableObjects)
        
        Publishers.CombineLatest($password, $confirmPassword).receive(on: RunLoop.main).map{
            (password, confirmPassword) in
            
            return !password.isEmpty && (password == confirmPassword)
        }
        .assign(to: \.passwordMatch, on: self)
        .store(in: &cancelableObjects)
        //4. Ahora realizaremos unos cambios en la ContentView
    }
}
