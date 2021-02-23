//
//  ViewModelType.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 21/01/2021.
//

import Foundation

protocol ViewModelType {
    associatedtype ViewState
    associatedtype PartialViewState
    associatedtype Event
    
    func reduceViewState(currentState: ViewState, partialState: PartialViewState) -> ViewState
    
    func initNewViewState() -> ViewState
}
