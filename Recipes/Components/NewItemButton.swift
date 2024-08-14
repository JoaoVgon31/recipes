//
//  NewItemButton.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 06/06/24.
//

import SwiftUI

struct NewItemButton: View {
    private let text: LocalizedStringKey
    private let action: () -> Void
    
    init(_ text: LocalizedStringKey, action: @escaping () -> Void) {
        self.text = text
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: "plus.circle.fill")
                Text(text)
            }
        }
    }
}

#Preview {
    NewItemButton("New Ingredient") {}
}
