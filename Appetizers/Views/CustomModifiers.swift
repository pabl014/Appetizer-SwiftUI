//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 08/01/2024.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
// then in code you write: .modifier(StandardButtonStyle())

// and when you add that extension:

// in this case you will write just: .standardButtonStyle()
//extension View {
//    func standardButtonStyle() -> some View {
//        self.modifier(StandardButtonStyle())
//    }
//}
