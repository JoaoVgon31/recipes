//
//  AddRecipeView.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 04/06/24.
//

import SwiftUI

struct AddRecipeScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var recipe: Recipe = Recipe()
    
    private func addRecipe() {
        withAnimation {
            modelContext.insert(recipe)
        }
        dismiss()
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $recipe.name)
                .accessibilityIdentifier("nameTextField")
            TextField("Notes", text: $recipe.notes)
            TextField("Preparation time", text: $recipe.preparationTime)
                .keyboardType(.numberPad)
            TextField("Servings", text: $recipe.servings)
                .keyboardType(.decimalPad)
            NavigationLinkSection("Ingredients") {
                AddIngredientsScreen(ingredients: $recipe.ingredients)
            }
            NavigationLinkSection("Allergens") {
                AddAllergensScreen(allergens: $recipe.allergens)
            }
            TextEditorSection("Instructions", value: $recipe.instructions)
        }
        .listSectionSpacing(16)
        .navigationTitle("New Recipe")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                DismissButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                SubmitButton(requiredFields: [recipe.name]) {
                    addRecipe()
                }
                .accessibilityIdentifier("submitRecipeButton")
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddRecipeScreen()
    }
    .modelContainer(for: Recipe.self, inMemory: true)
}
