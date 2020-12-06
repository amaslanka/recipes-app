//
//  MainViewController.swift
//  Recipes App
//
//  Created by Artur Maslanka on 06/12/2020.
//

import UIKit
import PureLayout

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    var didSetupConstraints = false
//    var bannerView = UIView(forAutoLayout: ())
//    var label = UILabel(forAutoLayout: ())
    
    let recipeCellReuseId = "recipeCellReuseId"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecipeCategoryCell.self, forCellReuseIdentifier: recipeCellReuseId)
        tableView.estimatedRowHeight = RecipeCategoryCell.CELL_HEIGHT
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipes"
        navigationController?.navigationBar.isTranslucent = false
        view = MainView(tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: recipeCellReuseId) as? RecipeCategoryCell else {
            return UITableViewCell()
        }
        return cell
    }

}

//extension MainViewController {
//
//    override func loadView() {
//        view = UIView()
//        view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
//        view.addSubview(bannerView)
//        bannerView.backgroundColor = UIColor.black
//        label.text = "Lorem ipsum dolor sit amet, consectetur   adipiscing elit. Fusce sit amet tortor ultricies, iaculis diam quis, molestie odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris eget interdum libero. Nulla at ipsum lectus. Praesent tristique nisl in tincidunt tempus. Nam purus metus, mattis eu fermentum et, ultricies in enim. Donec placerat laoreet dolor, quis tincidunt diam. Vivamus nisi ligula."
//        label.numberOfLines = 0
//        view.addSubview(label)
//        view.setNeedsUpdateConstraints()
//
//    }
//
//    override func updateViewConstraints() {
//        if (!didSetupConstraints) {
//            bannerView.autoSetDimensions(to: CGSize(width:         self.view.frame.width, height: 300))
//            bannerView.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
//            bannerView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 15)
//            bannerView.autoPinEdge(toSuperviewEdge: .leading, withInset: 15)
//            label.autoPinEdge(.top, to: .bottom, of: bannerView, withOffset: 50)
//            label.autoPinEdge(toSuperviewEdge: .trailing, withInset: 15)
//            label.autoPinEdge(toSuperviewEdge: .leading, withInset: 15)
//            didSetupConstraints = true
//        }
//        super.updateViewConstraints()
//    }
//}
