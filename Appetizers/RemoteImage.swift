//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Paweł Rudnik on 04/01/2024.
//

import SwiftUI
// explained: https://www.youtube.com/watch?v=b1oC7sLIgpI&t=18367s 7:12:07
// downloads the image and broadcasts that it has an image
final class ImageLoader: ObservableObject {
    
    // published always triggers ui change
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage) //conversion from NetworkManagers' UIKit UIImage to SwiftUI Image
            }
            
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    // if everything is alright, then put image, else use placeholder
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {

    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}
