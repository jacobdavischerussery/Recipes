//
//  RecipesListViewModel.swift
//  Recipes
//
//  Created by Jacob Davis on 2/7/25.
//

import Dependencies
import Foundation
import Networking

@MainActor
class RecipesListViewModel: ObservableObject {
    @Dependency private var recipesService: RecipesServiceProtocol
    @Published var recipes: [Recipe] = []
    
    func getRecipes() async {
        if let recipes = await recipesService.fetchRecipes() {
            self.recipes = recipes
        }
    }
}
