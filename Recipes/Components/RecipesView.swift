//
//  RecipesListView.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 07/06/24.
//

import SwiftUI
import SwiftData

struct RecipesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    
    private func deleteRecipes(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(recipes[index])
            }
        }
    }
    
    var body: some View {
        if recipes.isEmpty {
            NoRecipesView()
                .accessibilityIdentifier("noRecipesView")
        } else {
            ForEach(recipes) { recipe in
                NavigationLinkSection {
                    RecipeDetailsScreen(recipe: recipe)
                } label: {
                    RecipeRowView(recipe: recipe)
                }
                .accessibilityIdentifier("recipeItem")
            }
            .onDelete(perform: deleteRecipes)
        }
    }
}

#Preview {
    RecipesView()
        .modelContainer(for: Recipe.self, inMemory: true)
}
