//
//  RecipesListView.swift
//  Recipes
//
//  Created by Jacob Davis on 2/7/25.
//

import SwiftUI
import Networking
import RecipesUI
import RecipeAssets
import Resources

struct RecipesListView: View {
    @StateObject var viewModel = RecipesListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.viewState {
                case .idle:
                    retryView
                case .loading:
                    ProgressView("Loading Recipes....")
                case .loaded:
                    List(viewModel.recipes, id: \.id) { recipe in
                        rowContent(recipe: recipe)
                    }
                    .listStyle(PlainListStyle())
                    .background(Color.white)
                    .animation(.easeInOut, value: viewModel.recipes)
                case .error(let message):
                    VStack {
                        Text("Error: \(message)")
                            .foregroundColor(.red)
                        retryView
                    }
                }
                retryView
            }
            .navigationTitle(Resources.Common.title)
            .onAppear {
                Task {
                    await viewModel.getRecipes()
                }
            }
        }
    }
    
    var retryView: some View {
        Button("Refresh") {
            Task {
                await viewModel.getRecipes()
            }
        }
    }
    
    func rowContent(recipe: Recipe) -> some View {
        Group {
            if let imageUrl = recipe.photoUrlLarge {
                CachedAsyncImage(url: imageUrl)
                    .overlay(
                        VStack(alignment: .leading, spacing: 10) {
                            Text(recipe.name)
                                .font(.headline)
                                .foregroundColor(ColorAssets.primary)
                            Text(recipe.cuisine)
                                .font(.subheadline)
                                .foregroundColor(ColorAssets.primary)
                        }
                        .padding(16)
                        , alignment: .bottomLeading
                    )
            } else {
                EmptyView()
            }
        }
        .listRowSeparator(.hidden)
    }
}

#Preview {
    RecipesListView()
}
