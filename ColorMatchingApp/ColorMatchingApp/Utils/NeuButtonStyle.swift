//
//  NeuButtonStyle.swift
//  ColorMatchingApp
//
//  Created by Murad Ismayilov on 04.03.23.
//

import SwiftUI

//MARK: Create a custom ButtonStyle by implementing its makeBody(configuration:) method. You’ll lose some default behaviors like label color and dimming when tapped.
struct NeuButtonStyle: ButtonStyle {
    let width: CGFloat
    let height: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.2 : 1)
            .frame(width: width, height: height)
            .background(
                Group {
                    if configuration.isPressed {
                        Capsule()
                            .fill(Color.element)
                            .southEastShadow()
                    } else {
                        Capsule()
                            .fill(Color.element)
                            .northWestShadow()
                    }
                }
            )
    }
}
