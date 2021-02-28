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
    var categoriesDisposable: Disposable? = nil
    var scheduler = ConcurrentDispatchQueueScheduler(qos: .background)
    
    override init() {
        super.init()
        categoriesDisposable = RecipeRepository.shared
            .getRecipes()
            .subscribe(onNext: { categories in
                self.updateCategoriesList(categories)
            })
    }
    
    func onSearchBarTextChanged(text: String) {
        categoriesDisposable?.dispose()
        categoriesDisposable = RecipeRepository.shared
            .getRecipesByName(name: text)
            .subscribe(on: scheduler)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { categories in
                self.updateCategoriesList(categories)
            })
    }
    
    private func updateCategoriesList(_ categories: [Recipe]) {
        let categoriesState: PartialMainViewState = PartialMainViewState.Recipes(categories: categories)
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
