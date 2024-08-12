//
//  NoRecipeDetailsView.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 07/06/24.
//

import SwiftUI

struct NoRecipeDetailsView: View {
    var body: some View {
        ContentUnavailableView(
            "No Recipe Details",
            systemImage: "note.text.badge.plus",
            description: Text("Add some new information for this recipe to see them here\nTap 'Edit' to get started")
        )
    }
}

#Preview {
    NoRecipeDetailsView()
}
