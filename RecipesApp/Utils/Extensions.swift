//
//  Extensions.swift
//  RecipesApp
//
//  Created by Artur Maslanka on 28/02/2021.
//

import Foundation
import SwiftUI
import RxSwift


extension UIImageView {
    func load(url: URL, disposeBag: DisposeBag) {
        URLSession.shared.rx
            .response(request: URLRequest.init(url: url))
            .observe(on: MainScheduler.instance)
            .do(
                onCompleted: {
                    UIView.animate(withDuration: 0.3) {
                        self.alpha = 1
                    }
                },
                onSubscribe: {
                    UIView.animate(withDuration: 0.3) {
                        self.alpha = 0
                    }
                }
            )
            .subscribe(onNext: { data in
                // Update Image
                self.image = UIImage(data: data.data)
            }, onError: {_ in
                self.image = nil
            })
            .disposed(by: disposeBag)
    }
}

extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
