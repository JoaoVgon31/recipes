//
//  AddButton.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 06/06/24.
//

import SwiftUI

struct SubmitButton: View {
    private let text: LocalizedStringKey
    private let requiredFields: [Any?]
    private let action: () -> Void
    
    private var isMissingRequiredFields: Bool {
        requiredFields.contains(where: { field in
            if let stringField = field as? String {
                return stringField.isEmpty
            }
            if let arrayField = field as? [Any] {
                return arrayField.isEmpty
            }
            return true
        })
    }
    
    init(_ text: LocalizedStringKey = "Add", requiredFields: [Any?] = [], action: @escaping () -> Void) {
        self.text = text
        self.requiredFields = requiredFields
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
        }
        .disabled(isMissingRequiredFields)
    }
}

#Preview {
    let unfilledString: String = ""
    let filledString: String = "Filled String"
    let nilString: String? = nil
    let unfilledArray: [Int] = []
    let filledArray: [Int] = [1, 2]
    let nilArray: [Int]? = nil
    
    return VStack(spacing: 16) {
        SubmitButton {}
        SubmitButton("Custom Add Text") {}
        SubmitButton(requiredFields: [unfilledString]) {}
        SubmitButton(requiredFields: [unfilledArray]) {}
        SubmitButton(requiredFields: [nilString]) {}
        SubmitButton(requiredFields: [nilArray]) {}
        SubmitButton(requiredFields: [
            filledString,
            filledArray
        ]) {}
    }
}
