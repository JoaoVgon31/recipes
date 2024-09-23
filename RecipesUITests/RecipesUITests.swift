//
//  RecipesUITests.swift
//  RecipesUITests
//
//  Created by João Vitor Gonçalves Oliveira on 27/08/24.
//

import XCTest

final class RecipesUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments =  ["enable-testing"]
        app.launch()
    }

    func test_addRecipe_fromRecipesScreen() {        
        let noRecipesView = app.images["noRecipesView"]
        XCTAssertTrue(noRecipesView.exists)
        var recipeItemsCount = app.buttons.matching(identifier: "recipeItem").count
        XCTAssertTrue(recipeItemsCount == 0)
        
        let newRecipeButton = app.otherElements["newRecipeButton"]
        XCTAssertTrue(newRecipeButton.exists)
        newRecipeButton.tap()
        
        let addRecipeScreen = app.otherElements["addRecipeScreen"]
        XCTAssertTrue(addRecipeScreen.exists)
        
        let nameTextField = app.textFields["nameTextField"]
        XCTAssertTrue(nameTextField.exists)
        nameTextField.tap()
        nameTextField.typeText("Nome da receita")
        
        let submitRecipeButton = app.otherElements["submitRecipeButton"]
        XCTAssertTrue(submitRecipeButton.exists)
        submitRecipeButton.tap()
        
        XCTAssertFalse(noRecipesView.exists)
        recipeItemsCount = app.buttons.matching(identifier: "recipeItem").count
        XCTAssertTrue(recipeItemsCount == 1)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
