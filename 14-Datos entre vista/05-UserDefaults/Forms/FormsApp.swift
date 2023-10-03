//
//  FormsApp.swift
//  Forms
//
//  Created by Danilo Andrusco on 04-09-23.
//

import SwiftUI

@main
struct FormsApp: App {
    var body: some Scene {
        WindowGroup {
            //6. Como arreglamos el punto 5, deberemos cambiarlo aqui
            ContentView(settings: SettingsFactory())
        }
    }
}
