//
//  DismissButton.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 06/06/24.
//

import SwiftUI

struct DismissButton: View {
    @Environment(\.dismiss) var dismiss
    
    private let text: LocalizedStringKey
    
    init(_ text: LocalizedStringKey = "Cancel") {
        self.text = text
    }
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Text(text)
        }
    }
}

#Preview {
    DismissButton()
}
