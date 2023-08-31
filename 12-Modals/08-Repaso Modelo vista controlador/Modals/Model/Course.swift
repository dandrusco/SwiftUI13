//
//  Corse.swift
//  Modals
//
//  Created by Danilo Andrusco on 31-08-23.
//

import Foundation

struct Course : Identifiable {
    var id = UUID()
    var name : String
    var imagen : String
    var destacado : Bool = false
    var description : String = ""
}
