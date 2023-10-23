//
//  Course.swift
//  T2-Tinder
//
//  Created by Danilo Andrusco on 23-10-23.
//

import Foundation

struct Course {
    var name: String
    var image: String
}

#if DEBUG
var courses: [Course] = [
Course(name: "Swift desde cero",
       image: "swift"),
Course(name: "Python de cero a experto",
       image: "python"),
Course(name: "Interfaz grafica en Python",
       image: "interfazPython"),
Course(name: "Hacking con Python",
       image: "hackPython")
]

#endif
