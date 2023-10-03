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
            //12. Deberemos corregir este error por
            ContentView().environmentObject(SettingsFactory())
        }
    }
}
