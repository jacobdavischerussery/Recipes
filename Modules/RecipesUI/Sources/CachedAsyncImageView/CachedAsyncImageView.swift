
import RecipesFoundation
import SwiftUI

public struct CachedAsyncImage: View {
    let url: String
    @StateObject var loader = ImageLoader()
    
    public init(url: String) {
        self.url = url
    }
    
    public var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView() // Loading indicator
            }
        }
        .onAppear {
            Task {
                await loader.loadImage(from: url)
            }
        }
    }
}
