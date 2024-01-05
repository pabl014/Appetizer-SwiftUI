//
//  APButton.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 05/01/2024.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(Color.brandPrimary)
            .addBorder(.clear, width: 0, cornerRadius: 12)
    }
}

#Preview {
    APButton(title: "Test title")
}
