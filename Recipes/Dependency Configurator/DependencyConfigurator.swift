//
//  DependencyConfigurator.swift
//  Recipes
//
//  Created by Jacob Davis on 2/6/25.
//
import Dependencies
import Networking
import RecipesFoundation

struct DependencyConfigurator {
    static func registerDependencies() {
        DependencyRegistry.register(Engine())
        DependencyRegistry.register(RecipesService() as RecipesServiceProtocol)
        DependencyRegistry.register(ImageCache())
        DependencyRegistry.register(ImageService() as ImageServiceProtocol)
    }
}
