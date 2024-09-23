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
    
    private var ingredientsNames: [String] {
        recipe.ingredients.map({ $0.name })
    }
    
    private var allergensNames: [String] {
        recipe.allergens.map({ $0.name })
    }
    
    var body: some View {
        List {
            if recipe.hasDetails {
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
