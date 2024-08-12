//
//  RecipesApp.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 26/05/24.
//

import SwiftUI
import SwiftData

@main
struct RecipesApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Recipe.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RecipesScreen()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
