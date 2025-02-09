//
//  RecipesApp.swift
//  Recipes
//
//  Created by Jacob Davis on 2/5/25.
//

import SwiftUI

@main
struct RecipesInitializer {
    static func main() {
        DependencyConfigurator.registerDependencies()
        
        RecipesApp.main()
    }
}

struct RecipesApp: App {
    var body: some Scene {
        WindowGroup {
            RecipesListView()
        }
    }
}
