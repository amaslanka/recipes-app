//
//  RecipeRepository.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 24/02/2021.
//

import Foundation
import RxSwift

class RecipeCategoriesRepository {
    
    static let shared = RecipeCategoriesRepository()
        
    private let allRecipes = [
        RecipeCategory(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/IMG_67561180x180c6a2.jpg",
            name: "Pie"
        ),
        RecipeCategory(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/490284baac.jpg",
            name: "Curry"
        ),
        RecipeCategory(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/2888116c52.jpg",
            name: "Cookies"
        ),
        RecipeCategory(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/bakeddoughnutsa945.jpg",
            name: "Baked Doughnuts"
        ),
        RecipeCategory(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/popcorn243x2003a375fc9.jpg",
            name: "Popcorn"
        ),
        RecipeCategory(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/2285894885.jpg",
            name: "Pancakes"
        ),
        RecipeCategory(
            imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1575163942/RecipesApi/1161646_MEDIUMcf14.jpg",
            name: "Others"
        )
    ]
    
    private init() { }
    
    func getRecipeCategories() -> Observable<[RecipeCategory]> {
        return Observable.just(allRecipes)
    }
    
    func getRecipesByName(name: String) -> Observable<[RecipeCategory]> {
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
