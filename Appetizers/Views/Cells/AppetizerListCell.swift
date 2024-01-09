//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 02/01/2024.
//

import SwiftUI

struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                //.resizable()
//                .scaledToFit()
//                .frame(width: 120, height: 90)
//                .cornerRadius(10)
            // !!! no cache support !!!
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 90)
                    .cornerRadius(10)
                
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 90)
                    .cornerRadius(10)
            }

            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
    
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
        .preferredColorScheme(.dark)
}
