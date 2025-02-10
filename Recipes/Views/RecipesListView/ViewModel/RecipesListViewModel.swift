//
//  RecipesListViewModel.swift
//  Recipes
//
//  Created by Jacob Davis on 2/7/25.
//

import Dependencies
import Foundation
import Networking

enum ViewState {
    case idle
    case loading
    case loaded
    case error(String)
}

@MainActor
class RecipesListViewModel: ObservableObject {
    @Dependency private var recipesService: RecipesServiceProtocol
    @Published var recipes: [Recipe] = []
    @Published var viewState: ViewState = .idle
    
    func getRecipes() async {
        viewState = .loading
        
        do {
            if let recipes = try await recipesService.fetchRecipes(), !recipes.isEmpty {
                self.recipes = recipes
                viewState = .loaded
            } else {
                viewState = .idle
            }

        } catch {
            viewState = .error("Failed to load recipes")
        }
    }
}
