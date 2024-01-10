//
//  LoadingView.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 04/01/2024.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    // func below replaces the body variable on our view
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandPrimary
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
    
    
}

struct LoadingView: View {
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(edges: .all)
            
            //ActivityIndicator()
            ProgressView() // ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle())
                .tint(.brandPrimary)
                .scaleEffect(2) // double the normal size
        }
    }
    
}

#Preview {
    LoadingView()
        .preferredColorScheme(.light)
}
