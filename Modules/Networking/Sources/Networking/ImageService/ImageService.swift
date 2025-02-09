//
//  ImageService.swift
//  Networking
//
//  Created by Jacob Davis on 2/7/25.
//

import Dependencies
import Foundation

enum ImageLoadingError: Error {
    case invalidURL
    case failedToLoadImage
}

public protocol ImageServiceProtocol: Sendable {
    func fetchImage(url: String) async throws -> Data
}

public final class ImageService: ImageServiceProtocol {
    public init() {}
    
    public func fetchImage(url: String) async throws -> Data {
        do {
            guard let url = URL(string: url) else {
                throw ImageLoadingError.invalidURL
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        }
        catch {
            throw ImageLoadingError.failedToLoadImage
        }
    }
}
