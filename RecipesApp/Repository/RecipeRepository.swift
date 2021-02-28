//
//  RecipeRepository.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 24/02/2021.
//

import Foundation
import RxSwift

class RecipeRepository {
    
    static let shared = RecipeRepository()
        
    private let allRecipes = [
        Recipe(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/IMG_67561180x180c6a2.jpg",
            name: "Pie"
        ),
        Recipe(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/490284baac.jpg",
            name: "Curry"
        ),
        Recipe(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/2888116c52.jpg",
            name: "Cookies"
        ),
        Recipe(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/bakeddoughnutsa945.jpg",
            name: "Baked Doughnuts"
        ),
        Recipe(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/popcorn243x2003a375fc9.jpg",
            name: "Popcorn"
        ),
        Recipe(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/2285894885.jpg",
            name: "Pancakes"
        ),
        Recipe(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/1161646_MEDIUMcf14.jpg",
            name: "Others"
        )
    ]
    
    private init() { }
    
    func getRecipes() -> Observable<[Recipe]> {
        return Observable.just(allRecipes)
    }
    
    func getRecipesByName(name: String) -> Observable<[Recipe]> {
        return Observable.just(allRecipes)
            .map {
                if name.isEmpty {
                    return $0
                } else {
                    return $0.filter { $0.name.lowercased().contains(name.lowercased()) }
                }
            }
    }
    
}
