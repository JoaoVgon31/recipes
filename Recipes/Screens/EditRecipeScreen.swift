//
//  EditRecipeScreen.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 10/06/24.
//

import SwiftUI

struct EditRecipeScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var showDiscardChangesConfirmation: Bool = false
    @State private var originalRecipe: Recipe
    @State private var editedRecipe: Recipe
    
    init(recipe: Recipe) {
        self.originalRecipe = recipe
        self.editedRecipe = Recipe(with: recipe)
    }
    
    private func cancelEdit() {
        if originalRecipe != editedRecipe {
            showDiscardChangesConfirmation = true
        } else {
            dismiss()
        }
    }
    
    private func confirmEdit(_ editedRecipe: Recipe) {
        originalRecipe.name = editedRecipe.name
        originalRecipe.notes = editedRecipe.notes
        originalRecipe.preparationTime = editedRecipe.preparationTime
        originalRecipe.servings = editedRecipe.servings
        originalRecipe.ingredients = editedRecipe.ingredients
        originalRecipe.allergens = editedRecipe.allergens
        originalRecipe.instructions = editedRecipe.instructions
        try? modelContext.save()
        dismiss()
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $editedRecipe.name)
            TextField("Notes", text: $editedRecipe.notes)
            TextField("Preparation time", text: $editedRecipe.preparationTime)
                .keyboardType(.numberPad)
            TextField("Servings", text: $editedRecipe.servings)
                .keyboardType(.decimalPad)
            NavigationLinkSection("Ingredients") {
                AddIngredientsScreen(ingredients: $editedRecipe.ingredients)
            }
            NavigationLinkSection("Allergens") {
                AddAllergensScreen(allergens: $editedRecipe.allergens)
            }
            TextEditorSection("Instructions", value: $editedRecipe.instructions)
        }
        .listSectionSpacing(16)
        .navigationTitle("Edit Recipe")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    cancelEdit()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                SubmitButton("Done", requiredFields: [editedRecipe.name]) {
                    confirmEdit(editedRecipe)
                }
            }
        }
        .confirmationDialog("", isPresented: $showDiscardChangesConfirmation) {
            Button("Discard Changes", role: .destructive) {
                dismiss()
            }
            Button("Cancel", role: .cancel) {}
        }
    }
}
