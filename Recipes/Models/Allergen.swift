//
//  Allergen.swift
//  Recipes
//
//  Created by João Vitor Gonçalves Oliveira on 05/06/24.
//

import Foundation

struct Allergen: Codable, Identifiable, Equatable {
    var id: String
    var name: String
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
