//
//  AddButton.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 04/06/24.
//

import SwiftUI

struct NewRecipeButton: View {
    @State private var showAddRecipeScreen: Bool = false
    
    var body: some View {
        NewItemButton("New Recipe") {
            showAddRecipeScreen = true
        }
        .sheet(isPresented: $showAddRecipeScreen) {
            NavigationStack {
                AddRecipeScreen()
            }
            .accessibilityIdentifier("addRecipeScreen")
        }
    }
}

#Preview {
    NavigationStack {
        NewRecipeButton()
    }
}
