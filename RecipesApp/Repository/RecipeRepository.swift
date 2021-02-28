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
    
    private init() { }
    
    func getRecipes() -> Observable<[Recipe]> {
        return getRecipesList(recipesRequest: RecipesRequest())
    }
    
    func getRecipesByName(name: String) -> Observable<[Recipe]> {
        return getRecipesList(recipesRequest: RecipesRequest(title: name))
    }
    
    private func getRecipesList(recipesRequest: RecipesRequest) -> Observable<[Recipe]> {
        return Observable.just(recipesRequest)
            .flatMap { request -> Observable<RecipesApiResponse> in
                return APIClient.shared.send(apiRequest: request)
            }
            .map {
                $0.recipes
            }
    }
    
}
