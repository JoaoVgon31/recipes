//
//  RecipeDetailsCompactView.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 10/06/24.
//

import SwiftUI

struct RecipeDetailsCompactSection: View {
    let recipe: Recipe
    
    var body: some View {
        Section {
            if !recipe.notes.isEmpty {
                Text(recipe.notes)
                    .foregroundStyle(.secondary)
            }
            if !recipe.preparationTime.isEmpty{
                Label(
                    "Ready in \(recipe.preparationTime) min",
                    systemImage: "clock.fill"
                )
                .padding(.top, 2)
            }
            if !recipe.servings.isEmpty {
                Label(
                    "\(recipe.servings) servings",
                    systemImage: "fork.knife"
                )
                .padding(.top, 2)
            }
        }
    }
}
