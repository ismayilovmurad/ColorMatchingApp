//
//  ColorMatchingAppApp.swift
//  ColorMatchingApp
//
//  Created by Murad Ismayilov on 04.03.23.
//

import SwiftUI

//MARK: @main means this struct contains the entry point for the app
@main
struct ColorMatchingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(guess: RGB())
        }
    }
}
