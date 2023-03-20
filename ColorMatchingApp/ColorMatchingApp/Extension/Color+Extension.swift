//
//  ColorExtension.swift
//  ColorMatchingApp
//
//  Created by Murad Ismayilov on 04.03.23.
//

import Foundation
import SwiftUI

extension Color {
    /// Create a Color view from an RGB object.
    ///   - parameters:
    ///     - rgb: The RGB object.
    init(rgbStruct rgb: RGB) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
    }
    
    // Add Neumorphism colors to standard colors
    static let element = Color("Element")
    static let highlight = Color("Highlight")
    static let shadow = Color("Shadow")
}
