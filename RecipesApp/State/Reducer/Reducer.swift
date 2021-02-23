//
//  Reducer.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 21/01/2021.
//

import Foundation

protocol Reducer {
    associatedtype ViewState
    associatedtype PartialViewState
    func reduce(viewState: ViewState, partialViewState: PartialViewState) -> ViewState
}
