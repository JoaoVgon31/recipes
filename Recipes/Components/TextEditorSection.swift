//
//  TextEditorSection.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 05/06/24.
//

import SwiftUI

struct TextEditorSection: View {
    private let title: LocalizedStringKey
    @Binding private var value: String
    
    init(_ title: LocalizedStringKey, value: Binding<String>) {
        self.title = title
        self._value = value
    }
    
    var body: some View {
        Section {
            TextEditor(text: $value)
                .frame(minHeight: 80)
        } header: {
            Text(title)
        }
    }
}

#Preview {
    @State var value: String = ""
    return Form {
        TextEditorSection("Title", value: $value)
    }
}
