//
//  RecipesApp.swift
//  Recipes
//
//  Created by Jacob Davis on 2/5/25.
//

import SwiftUI

class RecipesInitializer: ObservableObject {
    @Published var isLoaded = false
    
    init() {
        DependencyConfigurator.registerDependencies()
        isLoaded = true
    }
}

@main
struct RecipesApp: App {
    @StateObject var recipeInitializer = RecipesInitializer()
    
    var body: some Scene {
        WindowGroup {
            if recipeInitializer.isLoaded {
                RecipesListView()
            } else {
                ProgressView()
            }
        }
    }
}
