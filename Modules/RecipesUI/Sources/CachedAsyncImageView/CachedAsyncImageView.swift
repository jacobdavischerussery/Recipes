
import RecipesFoundation
import SwiftUI
import RecipeAssets

public struct CachedAsyncImage: View {
    let url: String
    @StateObject var loader = ImageLoader()
    
    public init(url: String) {
        self.url = url
    }
    
    public var body: some View {
        Group {
            switch loader.viewState {
            case .idle:
                ProgressView()
            case .loading:
                ProgressView()
            case .loaded:
                if let image = loader.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(8)
                        .overlay(
                            ColorAssets.imageOveray
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        )
                } else {
                    ProgressView() // Loading indicator
                }
            case .error:
                EmptyView() // We can have a retry option here
            }
        }
        .onAppear {
            Task {
                await loader.loadImage(from: url)
            }
        }
    }
}
