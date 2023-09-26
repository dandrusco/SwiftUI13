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
        $userName.receive(on: RunLoop.main).map{
            userName in
            return userName.count >= 6
        }
        .assign(to: \.usernameLengthValid, on: self)
        
        //1. Necesitaremos dos suscriptores, el primero es casi identico al del usuario
        $password.receive(on: RunLoop.main).map{
            password in
            return password.count >= 8
        }
        .assign(to: \.passwordLengthValid, on: self)
        
        //2. Agregaremos el segundo suscriptor
        $password.receive(on: RunLoop.main).map{
            password in
            //3. Aqui comprobaremos el patron que queremos comprovar
            let pattern = "[A-Z]" //Exprecion regular de contiene mayusculas
            //4. Ahora comprobamos si hay mayuzculas
            if let _ = password.range(of: pattern, options: .regularExpression){
                return true
            }else{
                return false
            }
        }
        .assign(to: \.passwordCapitalLetter, on: self)
        
        //5. Ahora nos queda por validar si la confirmacion de la contraseña es igual a la contraseña, por lo tanto combinaremos 2 @Published
        Publishers.CombineLatest($password, $confirmPassword).receive(on: RunLoop.main).map{
            (password, confirmPassword) in
            //6. Devolveremos verdadero si el password no esta vacio y si el passwonrd es igual a la confimaciopn
            return !password.isEmpty && (password == confirmPassword)
        }
        .assign(to: \.passwordMatch, on: self)
    }
}
