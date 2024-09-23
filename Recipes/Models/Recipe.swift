//
//  Recipe.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 04/06/24.
//

import Foundation
import SwiftData

@Model
final class Recipe {
    @Attribute(.unique) var id: String
    var name: String
    var ingredients: [Ingredient]
    var allergens: [Allergen]
    var instructions: String
    var preparationTime: String
    var servings: String
    var notes: String
    
    var hasDetails: Bool {
        return ingredients.isEmpty &&
        allergens.isEmpty &&
        instructions.isEmpty &&
        notes.isEmpty &&
        preparationTime.isEmpty &&
        servings.isEmpty
    }
    
    init() {
        self.id = UUID().uuidString
        self.name = ""
        self.ingredients = []
        self.allergens = []
        self.instructions = ""
        self.preparationTime = ""
        self.notes = ""
        self.servings = ""
    }
    
    init(with recipe: Recipe) {
        self.id = recipe.id
        self.name = recipe.name
        self.ingredients = recipe.ingredients
        self.allergens = recipe.allergens
        self.instructions = recipe.instructions
        self.preparationTime = recipe.preparationTime
        self.notes = recipe.notes
        self.servings = recipe.servings
    }
}

extension Recipe: Equatable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
            return
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.ingredients == rhs.ingredients &&
        lhs.allergens == rhs.allergens &&
        lhs.instructions == rhs.instructions &&
        lhs.preparationTime == rhs.preparationTime &&
        lhs.servings == rhs.servings &&
        lhs.notes == rhs.notes
    }
}
