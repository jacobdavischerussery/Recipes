//
//  ImageCache.swift
//  RecipesFoundation
//
//  Created by Jacob Davis on 2/7/25.
//

import UIKit

public final class ImageCache {
    private let cache = NSCache<NSURL, UIImage>()
    
    public init() {}

    func getImage(for url: URL) -> UIImage? {
        return cache.object(forKey: url as NSURL)
    }

    func setImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
}
