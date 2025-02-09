
import Foundation
import Dependencies
import Networking
import UIKit

@MainActor
public final class ImageLoader: ObservableObject {
    @Dependency private var imageCache: ImageCache
    @Dependency private var imageService: ImageServiceProtocol
    
    @Published public var image: UIImage?
    
    public init() {}
    
    public func loadImage(from url: String) async {
        // Check cache first
        if let url = URL(string: url),
           let cachedImage = imageCache.getImage(for: url) {
            self.image = cachedImage
            return
        }
        
        do {
            if let data = try? await imageService.fetchImage(url: url),
               let downloadedImage = UIImage(data: data),
               let url = URL(string: url) {
                self.imageCache.setImage(downloadedImage, for: url)
                self.image = downloadedImage
            }
        } catch {
            print("error loading image")
        }
    }
}
