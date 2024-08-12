//
//  AddIngredientsScreen.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 05/06/24.
//

import SwiftUI

struct AddIngredientsScreen: View {
    @FocusState private var focusedField: Int?
    @Binding var ingredients: [Ingredient]
    
    private func getIngredientIndex(_ ingredient: Ingredient) -> Int? {
        ingredients.firstIndex(where: {
            $0.id == ingredient.id
        })
    }
    
    private func focusOnFirstField() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            focusedField = 0
        }
    }
    
    private func addIngredient() {
        withAnimation {
            ingredients.insert(Ingredient(name: ""), at: 0)
        } completion: {
            focusOnFirstField()
        }
    }
    
    private func deleteIngredients(offsets: IndexSet) {
        withAnimation {
            ingredients.remove(atOffsets: offsets)
        }
    }
    
    var body: some View {
        VStack {
            if ingredients.isEmpty {
                Spacer()
                Text("No Ingredients")
                    .foregroundStyle(.secondary)
                Spacer()
            } else {
                Form {
                    List {
                        ForEach($ingredients) { ingredient in
                            TextField("", text: ingredient.name)
                                .focused($focusedField, equals: getIngredientIndex(ingredient.wrappedValue))
                                .onSubmit(addIngredient)
                        }
                        .onDelete(perform: deleteIngredients)
                    }
                }
            }
        }
        .navigationTitle("Ingredients")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
                    .disabled(ingredients.isEmpty)
            }
            ToolbarItemGroup(placement: .bottomBar) {
                NewItemButton("New Ingredient") {
                    addIngredient()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    struct Preview: View {
        @State var ingredients: [Ingredient] = []
        var body: some View {
            NavigationStack {
                AddIngredientsScreen(ingredients: $ingredients)
            }
        }
    }
    
    return Preview()
}
