//
//  Course.swift
//  P2-Tinder
//
//  Created by Juan Gabriel Gomila Salas on 03/03/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import Foundation
struct Course {
    var name: String
    var image: String
    var url: String
    var likes: Bool
}

#if DEBUG
var courses: [Course] = [
    Course(name: "Probabilidad y Variables Aleatorias", image: "maths", url: "https://cursos.frogamesformacion.com/courses/libro-probabilidad", likes:false),
    Course(name: "Machine Learning de la A a la Z", image: "ml_az", url: "https://cursos.frogamesformacion.com/courses/machine-learning-az", likes:false),
    Course(name: "Curso completo de Sage", image: "python", url: "https://cursos.frogamesformacion.com/collections?q=Curso+completo+de+Sage", likes:false),
    Course(name: "Aprueba la Selectividad", image: "selectividad", url: "https://cursos.frogamesformacion.com/collections?q=Aprueba+la+Selectividad", likes:false),
    Course(name: "Curso de Swift UI e iOS 13", image: "swift", url: "https://cursos.frogamesformacion.com/courses/ios-13", likes:false),
    Course(name: "Tensorflow 2 al completo", image: "tensorflow2", url: "https://cursos.frogamesformacion.com/courses/tensorflow-2", likes:false),
    Course(name: "Curso de Unreal Engine", image: "unrealengine", url: "https://cursos.frogamesformacion.com/courses/unreal-5", likes:false),
    Course(name: "Curso de Unity 2019", image: "videogames", url: "https://cursos.frogamesformacion.com/courses/unity-2020", likes:false)
]

#endif
