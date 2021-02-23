//
//  MainViewModel.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 21/01/2021.
//

import Foundation
import RxSwift

class MainViewModel: BaseViewModel<MainViewState, PartialMainViewState, MainEvent> {
    
    private let disposeBag = DisposeBag()
    private let viewStateReducer = MainReducer()
    
    let initialTitle = "Recipes"
    var categories = [RecipeCategory]()
    
    func onSearchBarTextChanged(text: String) {
        let category = RecipeCategory(imageUrl: "", name: text)
        categories.append(category)
        let categoriesState: PartialMainViewState = PartialMainViewState.Categories(categories: categories)
        updatePartialViewState(partialStates: [categoriesState], disposeBag: disposeBag)
    }
    
    override func reduceViewState(currentState: MainViewState, partialState: PartialMainViewState) -> MainViewState {
        return viewStateReducer.reduce(viewState: currentState, partialViewState: partialState)
    }
    
    override func initNewViewState() -> MainViewState {
        let title = PartialMainViewState.Title(text: initialTitle)
        let mainState = MainViewState()
        mainState.title = title
        return mainState
    }

}
