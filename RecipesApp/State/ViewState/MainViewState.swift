//
//  MainViewState.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 21/01/2021.
//

import Foundation


class MainViewState : NSObject, NSCopying {
    
    var title = PartialMainViewState.Title()
    var recipes = PartialMainViewState.Recipes()
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = MainViewState()
        copy.title = title.copy() as! PartialMainViewState.Title
        copy.recipes = recipes.copy() as! PartialMainViewState.Recipes
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

    class Recipes : PartialMainViewState, NSCopying {
        var list = [Recipe]()
        
        init(categories: [Recipe] = [Recipe]()) {
            self.list = categories
        }
        
        func copy(with zone: NSZone? = nil) -> Any {
            let copy = Recipes()
            copy.list = list.map { Recipe(recipe: $0) }
            return copy
        }
    }
}
