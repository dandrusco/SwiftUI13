//
//  CourseFactory.swift
//  Modals
//
//  Created by Danilo Andrusco on 31-08-23.
//

import Foundation

//2. Declararemos una estructura de CourseFactory
struct CourseFactory {
    //4. Pegamos aqui los cursos pero deeberemos anteponer static antes del var courses.... para poder acceder a ello
    static var courses = [
        Course(name: "Swift desde cero", imagen: "swift", description: "Swift es un lenguaje rápido y eficiente que proporciona información en tiempo real y puede incorporarse fácilmente al código de Objective-C existente. Así, los desarrolladores no sólo pueden programar de una forma más segura y confiable, sino también ahorrar tiempo y enriquecer la experiencia con las apps."),
        Course(name: "Python de cero a experto", imagen: "python", destacado: true),
        Course(name: "Interfaz grafica en Python", imagen: "interfazPython"),
        Course(name: "Hacking con Python", imagen: "hackPython")
    ]
}

//5. Ahora si nos vamos a la ContentView nos daremos cuenta que nos dara error al no encontrar los cursos
