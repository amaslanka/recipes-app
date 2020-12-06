//
//  RecipeCategoryCell.swift
//  Recipes App
//
//  Created by Artur Maslanka on 06/12/2020.
//

import UIKit
import PureLayout

class RecipeCategoryCell: UITableViewCell {
    
    private static let PICTURE_SIZE: CGFloat = 64.0
    private static let MARGIN_SIZE: CGFloat = 4

    static let CELL_HEIGHT = PICTURE_SIZE + MARGIN_SIZE
    
    lazy var picture: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "realm_logo.png"))
        imageView.autoSetDimensions(to: CGSize(width: RecipeCategoryCell.PICTURE_SIZE, height: RecipeCategoryCell.PICTURE_SIZE))
        imageView.layer.cornerRadius = RecipeCategoryCell.PICTURE_SIZE / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(picture)
        contentView.addSubview(titleLabel)
        
        let pictureInsets = UIEdgeInsets(
            top: RecipeCategoryCell.MARGIN_SIZE,
            left: 16,
            bottom: RecipeCategoryCell.MARGIN_SIZE,
            right: 0
        )
        picture.autoPinEdgesToSuperviewEdges(with: pictureInsets, excludingEdge: .right)

        let titleInsets = UIEdgeInsets(
            top: RecipeCategoryCell.MARGIN_SIZE,
            left: 0,
            bottom: RecipeCategoryCell.MARGIN_SIZE,
            right: 16
        )
        titleLabel.autoPinEdgesToSuperviewEdges(with: titleInsets, excludingEdge: .left)
        titleLabel.autoPinEdge(.left, to: .right, of: picture, withOffset: 16.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
