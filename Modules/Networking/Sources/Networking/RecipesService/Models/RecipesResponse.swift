//
//  RecipesResponse.swift
//  Networking
//
//  Created by Jacob Davis on 2/7/25.
//

public struct RecipesResponse: Codable, Sendable {
    public let recipes: [Recipe]
}

public struct Recipe: Codable, Sendable, Equatable {
    public let cuisine: String
    public let name: String
    public let photoUrlLarge: String?
    public let photoUrlSmall: String?
    public let id: String
    public let sourceUrl: String?
    public let youtubeUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case id = "uuid"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
    }
}
