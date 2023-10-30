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
    var url: String
}

#if DEBUG
var courses: [Course] = [
Course(name: "Swift desde cero",
       image: "swift",
       url: "https://www.tectroya.cl/category/swift-desde-cero/"),
Course(name: "Python de cero a experto",
       image: "python",
       url: "https://www.tectroya.cl/category/python-de-cero-a-experto/"),
Course(name: "Interfaz grafica en Python",
       image: "interfazPython",
       url: "https://www.tectroya.cl/category/interfaz-grafica-en-python/"),
Course(name: "Hacking con Python",
       image: "hackPython",
       url: "https://www.tectroya.cl/category/hacking-con-python/")
]

#endif
