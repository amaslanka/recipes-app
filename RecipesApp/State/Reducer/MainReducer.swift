//
//  MainReducer.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 21/01/2021.
//

import Foundation

struct MainReducer : Reducer {

    typealias ViewState = MainViewState
    typealias PartialViewState = PartialMainViewState
    
    func reduce(viewState: MainViewState, partialViewState: PartialMainViewState) -> MainViewState {
        let copy = viewState.copy() as! MainViewState
        switch partialViewState {
        case is PartialMainViewState.Title:
            copy.title = partialViewState as! PartialMainViewState.Title
        case is PartialMainViewState.Categories:
            copy.categories = partialViewState as! PartialMainViewState.Categories
        default:
            fatalError("Unsupported partial state!")
        }
        return copy
    }
}


