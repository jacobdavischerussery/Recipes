
import Foundation
import Dependencies
import Networking
import UIKit

public enum LoaderState {
    case idle
    case loading
    case loaded
    case error
}

@MainActor
public final class ImageLoader: ObservableObject {
    @Dependency private var imageCache: ImageCache
    @Dependency private var imageService: ImageServiceProtocol
    
    @Published public var image: UIImage?
    @Published public var viewState: LoaderState = .idle
    
    public init() {}
    
    public func loadImage(from url: String) async {
        viewState = .loading
        // Check cache first
        if let url = URL(string: url),
           let cachedImage = imageCache.getImage(for: url) {
            self.image = cachedImage
            viewState = .loaded
            return
        }
        
        do {
            if let data = try? await imageService.fetchImage(url: url),
               let downloadedImage = UIImage(data: data),
               let url = URL(string: url) {
                self.imageCache.setImage(downloadedImage, for: url)
                self.image = downloadedImage
                viewState = .loaded
            } else {
                viewState = .idle
            }
        } catch {
            viewState = .error
        }
    }
}
