//
//  AddAllergensScreen.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 05/06/24.
//

import SwiftUI

struct AddAllergensScreen: View {
    @FocusState private var focusedField: Int?
    @Binding var allergens: [Allergen]
    
    private func getAllergenIndex(_ allergen: Allergen) -> Int? {
        allergens.firstIndex(where: {
            $0.id == allergen.id
        })
    }
    
    private func focusOnFirstField() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            focusedField = 0
        }
    }
    
    private func addAllergen() {
        withAnimation {
            allergens.insert(Allergen(name: ""), at: 0)
        } completion: {
            focusOnFirstField()
        }
    }
    
    private func deleteAllergens(offsets: IndexSet) {
        withAnimation {
            allergens.remove(atOffsets: offsets)
        }
    }
    
    var body: some View {
        VStack {
            if allergens.isEmpty {
                Spacer()
                Text("No Allergens")
                    .foregroundStyle(.secondary)
                Spacer()
            } else {
                Form {
                    List {
                        ForEach($allergens) { allergen in
                            TextField("", text: allergen.name)
                                .focused($focusedField, equals: getAllergenIndex(allergen.wrappedValue))
                                .onSubmit(addAllergen)
                        }
                        .onDelete(perform: deleteAllergens)
                    }
                }
            }
        }
        .navigationTitle("Allergens")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
                    .disabled(allergens.isEmpty)
            }
            ToolbarItemGroup(placement: .bottomBar) {
                NewItemButton("New Allergen") {
                    addAllergen()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    struct Preview: View {
        @State var allergens: [Allergen] = []
        var body: some View {
            NavigationStack {
                AddAllergensScreen(allergens: $allergens)
            }
        }
    }
    
    return Preview()
}
