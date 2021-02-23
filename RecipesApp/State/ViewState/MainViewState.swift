//
//  MainViewState.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 21/01/2021.
//

import Foundation


class MainViewState : NSObject, NSCopying {
    
    var title = PartialMainViewState.Title()
    var categories = PartialMainViewState.Categories()
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = MainViewState()
        copy.title = title.copy() as! PartialMainViewState.Title
        copy.categories = categories.copy() as! PartialMainViewState.Categories
        return copy
    }
}

class PartialMainViewState {
    
    class Title : PartialMainViewState, NSCopying {
        var text: String = ""
        
        init(text: String = "") {
            self.text = text
        }
        
        func copy(with zone: NSZone? = nil) -> Any {
            let copy = Title()
            copy.text = text
            return copy
        }
    }

    class Categories : PartialMainViewState, NSCopying {
        var list = [RecipeCategory]()
        
        init(categories: [RecipeCategory] = [RecipeCategory]()) {
            self.list = categories
        }
        
        func copy(with zone: NSZone? = nil) -> Any {
            let copy = Categories()
            copy.list = list.map { RecipeCategory(recipeCategory: $0) }
            return copy
        }
    }
}
