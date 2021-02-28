//
//  MainViewController.swift
//  Recipes App
//
//  Created by Artur Maslanka on 06/12/2020.
//

import UIKit
import PureLayout
import RxSwift
import RxCocoa


class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()
    private let recipeCellReuseId = "recipeCellReuseId"
    private let transitionDuration = 0.35
    private let userInputDebounceTimeMs = 500
    
    private let emptyMessage = "No recipes found"
    
    private var recipes = [Recipe]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecipeCell.self, forCellReuseIdentifier: recipeCellReuseId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = RecipeCell.CELL_HEIGHT
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    lazy var mainView: MainView = {
        return MainView(tableView: self.tableView)
    }()

    override func loadView() {
        super.loadView()

        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        
        bindViewModel()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recipes.count == 0 {
            self.tableView.setEmptyMessage(emptyMessage)
        } else {
            self.tableView.restore()
        }
        
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: recipeCellReuseId) as? RecipeCell else {
            return UITableViewCell()
        }
        cell.setRecipe(recipe: recipes[indexPath.row])
        return cell
    }
    
    func updateTitle(text: String) {
        title = text
    }
    
    func updateRecipes(recipes: [Recipe]) {
        self.recipes = recipes
        UIView.transition(
            with: tableView,
            duration: transitionDuration,
            options: .transitionCrossDissolve,
            animations: { self.tableView.reloadData() }
        )
    }
    
    func handleEvent(event: MainEvent) {
        // TODO: Handle each type of MainEvent
    }

}

extension MainViewController {
    func bindViewModel() {
        mainView.searchView
            .rx
            .text
            .orEmpty
            .asObservable()
            .debounce(.milliseconds(userInputDebounceTimeMs), scheduler: MainScheduler.instance)
            .subscribe(onNext: { text in
                self.viewModel.onSearchBarTextChanged(text: text)
            })
            .disposed(by: disposeBag)
        
        viewModel.viewState
            .subscribe(onNext: { viewState in
                self.updateTitle(text: viewState.title.text)
                self.updateRecipes(recipes: viewState.recipes.list)
                print("Updated recipes list size: \(viewState.recipes.list.count)")
            })
            .disposed(by: disposeBag)
        
        viewModel.events
            .subscribe(onNext: { event in
                self.handleEvent(event: event)
            })
            .disposed(by: disposeBag)
    }
}
