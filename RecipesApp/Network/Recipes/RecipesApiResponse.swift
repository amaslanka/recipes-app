//
//  RecipesApiResponse.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 28/02/2021.
//

import Foundation

struct RecipesApiResponse : Codable {
    let count: Int
    let recipes: [Recipe]
}
