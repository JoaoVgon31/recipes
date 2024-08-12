//
//  ContentView.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 26/05/24.
//

import SwiftUI
import SwiftData

struct RecipesScreen: View {
    @Query private var recipes: [Recipe]
    
    var body: some View {
        List {
            RecipesView()
        }
        .listSectionSpacing(16)
        .navigationTitle("Recipes")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
                    .disabled(recipes.isEmpty)
            }
            ToolbarItemGroup(placement: .bottomBar) {
                NewRecipeButton()
                Spacer()
            }
        }
    }
}

#Preview {
    NavigationStack {
        RecipesScreen()
    }
    .modelContainer(for: Recipe.self, inMemory: true)
}
