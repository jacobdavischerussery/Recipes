//
//  RecipesService.swift
//  Networking
//
//  Created by Jacob Davis on 2/7/25.
//

import Dependencies

public protocol RecipesServiceProtocol {
    func fetchRecipes() async throws -> [Recipe]?
}

public final class RecipesService: RecipesServiceProtocol {
    @Dependency private var networkEngine: Engine
    
    public init() {}
    
    public func fetchRecipes() async throws -> [Recipe]? {
        let response = try? await networkEngine.request(RecipesAPI.getRecipes, type: RecipesResponse.self)
        return response?.recipes
    }
}
