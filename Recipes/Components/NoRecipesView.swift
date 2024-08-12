//
//  NoRecipesView.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 07/06/24.
//

import SwiftUI

struct NoRecipesView: View {
    var body: some View {
        ContentUnavailableView(
            "No Recipes",
            systemImage: "book.closed",
            description: Text("Create your recipe book\nTap 'New Recipe' to get started")
        )
    }
}

#Preview {
    NoRecipesView()
}
