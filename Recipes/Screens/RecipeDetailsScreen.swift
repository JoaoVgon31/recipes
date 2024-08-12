//
//  RecipeDetailsScreen.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 04/06/24.
//

import SwiftUI

struct RecipeDetailsScreen: View {
    @Environment(\.modelContext) private var modelContext
    let recipe: Recipe
    
    private func isRecipeEmpty(_ recipe: Recipe) -> Bool {
        return recipe.ingredients.isEmpty &&
        recipe.allergens.isEmpty &&
        recipe.instructions.isEmpty &&
        recipe.notes.isEmpty &&
        recipe.preparationTime.isEmpty &&
        recipe.servings.isEmpty
    }
    
    private var ingredientsNames: [String] {
        recipe.ingredients.map({ $0.name })
    }
    
    private var allergensNames: [String] {
        recipe.allergens.map({ $0.name })
    }
    
    var body: some View {
        List {
            if isRecipeEmpty(recipe) {
                NoRecipeDetailsView()
            } else {
                RecipeDetailsCompactSection(recipe: recipe)
                if !recipe.ingredients.isEmpty {
                    ListSection("Ingredients", list: ingredientsNames)
                }
                if !recipe.allergens.isEmpty {
                    ListSection("Allergens", list: allergensNames)
                }
                if !recipe.instructions.isEmpty {
                    Section {
                        Text(recipe.instructions)
                    } header: {
                        Text("Instructions")
                    }
                }
            }
        }
        .listSectionSpacing(16)
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem {
                EditRecipeButton(recipe: recipe)
            }
        }
    }
}
