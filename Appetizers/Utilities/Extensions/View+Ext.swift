//
//  View+Ext.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 04/01/2024.
//

import SwiftUI

// .cornerRadius() replacement, because it will be deprecated soon
extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
             .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}

/// usage:
/// .addBorder(Color.white, width: 1, cornerRadius: 10)
