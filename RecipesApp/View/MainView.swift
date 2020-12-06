//
//  MainView.swift
//  Recipes App
//
//  Created by Artur Maslanka on 06/12/2020.
//

import UIKit
import PureLayout

class MainView: UIView {
    
    lazy var searchView: UISearchBar = {
        let searchBar = UISearchBar(forAutoLayout: ())
        searchBar.backgroundImage = UIImage()
        return searchBar
    }()
    
    var tableView: UITableView!
    
    init(tableView: UITableView) {
        super.init(frame: .zero)
        self.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tableView = tableView
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubview(searchView)
        addSubview(tableView)
    }
    
    override func updateConstraints() {
        setupConstraints()
        super.updateConstraints()
    }
    
    func setupConstraints() {
        searchView.autoPinEdge(toSuperviewSafeArea: .top)
        searchView.autoPinEdge(toSuperviewEdge: .left)
        searchView.autoPinEdge(toSuperviewEdge: .right)
        tableView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        tableView.autoPinEdge(.top, to: .bottom, of: searchView)
    }

}
