//
//  ListSection.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 10/06/24.
//

import SwiftUI

struct ListSection: View {
    private let title: LocalizedStringKey
    private let list: [Any?]
    
    init(_ title: LocalizedStringKey, list: [Any?]) {
        self.title = title
        self.list = list
    }
    
    private func describeList(_ list: [Any?]) -> [String] {
        return list.map({
            if let nonNilItem = $0 {
                return String(describing: nonNilItem)
            }
            return ""
        })
    }
    
    var body: some View {
        Section {
            ForEach(describeList(list), id: \.self) {
                if !$0.isEmpty {
                    Text($0)
                }
            }
        } header: {
            Text(title)
        }
    }
}

#Preview {
    @Previewable @State var list: [String?] = ["Item 1", nil, "Item 2"]
    return Form {
        ListSection("Items", list: list)
    }
}
