//
//  RecipesTests.swift
//  RecipesTests
//
//  Created by João Vitor Gonçalves Oliveira on 26/08/24.
//

import XCTest
@testable import Recipes
import SwiftData

final class RecipesTests: XCTestCase {
    func test_hasDetails_withEmptyRecipe_shouldBeTrue() {
        let recipe = Recipe()
        XCTAssertTrue(recipe.hasDetails, "hasDetails should be true when all fields, except id and name, are empty")
    }

    func test_hasDetails_withNonEmptyRecipe_shouldBeFalse() {
        let recipe = Recipe()
        let mirror = Mirror(reflecting: recipe)
                
        for child in mirror.children {
            guard let propertyName = child.label else { continue }
            
            if propertyName == "_id" || propertyName == "_name" || propertyName == "_$backingData" || propertyName == "_$observationRegistrar" {
                continue
            }
            
            switch propertyName {
            case "_ingredients":
                recipe.ingredients = [Ingredient(name: "Flour")]
            case "_allergens":
                recipe.allergens = [Allergen(name: "Peanuts")]
            case "_instructions":
                recipe.instructions = "Mix all ingredients"
            case "_preparationTime":
                recipe.preparationTime = "30 mins"
            case "_servings":
                recipe.servings = "4"
            case "_notes":
                recipe.notes = "This is a note"
            default:
                XCTFail("Unhandled property: \(propertyName)")
            }
            
            XCTAssertFalse(recipe.hasDetails, "hasDetails should be false when \(propertyName) is not empty")
            
            switch propertyName {
            case "_ingredients":
                recipe.ingredients = []
            case "_allergens":
                recipe.allergens = []
            case "_instructions":
                recipe.instructions = ""
            case "_preparationTime":
                recipe.preparationTime = ""
            case "_servings":
                recipe.servings = ""
            case "_notes":
                recipe.notes = ""
            default:
                XCTFail("Unhandled property: \(propertyName)")
            }
        }
    }
}
