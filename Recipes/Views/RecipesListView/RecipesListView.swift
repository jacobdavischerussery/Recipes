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
                List(viewModel.recipes, id: \.id) { recipe in
                    rowContent(recipe: recipe)
                }
                .listStyle(PlainListStyle())
                .background(Color.white)
            }
            .navigationTitle(Resources.Common.title)
            .onAppear {
                Task {
                    await viewModel.getRecipes()
                }
            }
        }
    }
    
    func rowContent(recipe: Recipe) -> some View {
        Group {
            if let imageUrl = recipe.photoUrlLarge {
                CachedAsyncImage(url: imageUrl)
                    .cornerRadius(8)
                    .overlay(
                        ColorAssets.imageOveray
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    )
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
