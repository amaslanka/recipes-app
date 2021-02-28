//
//  RecipeCategory.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 21/01/2021.
//

import Foundation

struct Recipe {
    let imageUrl: String
    let name: String
    
    init(imageUrl: String, name: String) {
        self.imageUrl = imageUrl
        self.name = name
    }
    
    init(recipe: Recipe) {
        self.imageUrl = recipe.imageUrl
        self.name = recipe.name
    }
}
