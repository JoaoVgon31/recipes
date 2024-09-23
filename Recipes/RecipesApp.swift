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
        
        var inMemory = false
        #if DEBUG
        if CommandLine.arguments.contains("enable-testing") {
            inMemory = true
        }
        #endif
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: inMemory)

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
