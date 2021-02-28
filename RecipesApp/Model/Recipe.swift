//
//  RecipeCategory.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 21/01/2021.
//

import Foundation

struct Recipe : Codable {
    let imageUrl: String
    let title: String
    
    init(imageUrl: String, name: String) {
        self.imageUrl = imageUrl
        self.title = name
    }
    
    init(recipe: Recipe) {
        self.imageUrl = recipe.imageUrl
        self.title = recipe.title
    }
    
    private enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case title
    }
}
