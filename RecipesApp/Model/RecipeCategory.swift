//
//  RecipeCategory.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 21/01/2021.
//

import Foundation

struct RecipeCategory {
    let imageUrl: String
    let name: String
    
    init(imageUrl: String, name: String) {
        self.imageUrl = imageUrl
        self.name = name
    }
    
    init(recipeCategory: RecipeCategory) {
        self.imageUrl = recipeCategory.imageUrl
        self.name = recipeCategory.name
    }
}
