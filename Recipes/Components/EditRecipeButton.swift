//
//  EditRecipeButton.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 12/06/24.
//

import SwiftUI

struct EditRecipeButton: View {
    @State private var showEditRecipeScreen: Bool = false
    let recipe: Recipe
    
    var body: some View {
        Button("Edit") {
            showEditRecipeScreen = true
        }
        .sheet(isPresented: $showEditRecipeScreen) {
            NavigationStack {
                EditRecipeScreen(recipe: recipe)
            }
        }
    }
}
