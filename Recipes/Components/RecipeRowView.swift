//
//  RecipeRowView.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 04/06/24.
//

import SwiftUI

struct RecipeRowView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.name)
                .font(.headline)
            RecipeDetailsCompactSection(recipe: recipe)
        }
    }
}
