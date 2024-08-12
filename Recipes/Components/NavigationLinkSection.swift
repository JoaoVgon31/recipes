//
//  NavigationLinkSection.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 05/06/24.
//

import SwiftUI

struct NavigationLinkSection<Label: View, Destination: View>: View {
    private var label: Label
    private var destination: Destination
    
    init(
        @ViewBuilder destination: () -> Destination,
        @ViewBuilder label: () -> Label
    ) {
        self.label = label()
        self.destination = destination()
    }
    
    var body: some View {
        Section {
            NavigationLink {
                destination
            } label: {
                label
            }
        }
    }
}

extension NavigationLinkSection where Label == Text {
    init(_ title: String, destination: () -> Destination) {
        self.label = Text(title)
        self.destination = destination()
    }
}

#Preview {
    NavigationStack {
        Form {
            NavigationLinkSection("Hello World!") {
                Text("Hello World!")
            }
        }
    }
}
