//
//  FidgetAppApp.swift
//  FidgetApp Watch App
//
//  Created by Jose Blanco on 6/26/23.
//

import SwiftUI

@main
struct FidgetApp_Watch_AppApp: App {
    @AppStorage("vibration") var vibration: Vibration = .strong
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                OptionsView()
            }
            .tabViewStyle(PageTabViewStyle())
        }
       
    }
}
