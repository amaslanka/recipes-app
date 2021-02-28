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
    private var recipes = [Recipe]()
    
    let recipeCellReuseId = "recipeCellReuseId"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecipeCell.self, forCellReuseIdentifier: recipeCellReuseId)
        tableView.estimatedRowHeight = RecipeCell.CELL_HEIGHT
        tableView.rowHeight = UITableView.automaticDimension
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
        tableView.reloadData()
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
            .subscribe(onNext: { text in
                self.viewModel.onSearchBarTextChanged(text: text)
            })
            .disposed(by: disposeBag)
        
        viewModel.viewState
            .debug()
            .subscribe(onNext: { viewState in
                self.updateTitle(text: viewState.title.text)
                self.updateRecipes(recipes: viewState.recipes.list)
            })
            .disposed(by: disposeBag)
        
        viewModel.events
            .subscribe(onNext: { event in
                self.handleEvent(event: event)
            })
            .disposed(by: disposeBag)
    }
}
