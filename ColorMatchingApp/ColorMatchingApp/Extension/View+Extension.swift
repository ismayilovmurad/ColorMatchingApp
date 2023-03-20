//
//  ViewExtension.swift
//  ColorMatchingApp
//
//  Created by Murad Ismayilov on 04.03.23.
//

import SwiftUI

extension View {
    /// Simulate shining a light on the northwest edge of a view.
    /// Light shadow on the northwest edge, dark shadow on the southeast edge.
    ///   - parameters:
    ///     - radius: The size of the shadow
    ///     - offset: The value used for (-x, -y) and (x, y) offsets
    func northWestShadow(radius: CGFloat = 16, offset: CGFloat = 6) -> some View {
        return self
            .shadow(
                color: .highlight,
                radius: radius,
                x: -offset,
                y: -offset)
            .shadow(
                color: .shadow, radius: radius, x: offset, y: offset)
    }
    
    /// Simulate shining a light on the southeast edge of a view.
    /// Light shadow on the southeast edge, dark shadow on the northwest edge.
    ///   - parameters:
    ///     - radius: The size of the shadow
    ///     - offset: The value used for (-x, -y) and (x, y) offsets
    func southEastShadow(radius: CGFloat = 16, offset: CGFloat = 6) -> some View {
        return self
            .shadow(
                color: .shadow, radius: radius, x: -offset, y: -offset)
            .shadow(
                color: .highlight, radius: radius, x: offset, y: offset)
    }
}
