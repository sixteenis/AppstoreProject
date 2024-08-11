//
//  ReuseIdentifier+.swift
//  PolaroidProject
//
//  Created by 박성민 on 7/22/24.
//

import UIKit
import Kingfisher
protocol ReuseIdentifier: AnyObject {
    static var id: String { get }
}

extension ReuseIdentifier {
    static var id: String {
        return String(describing: self)
    }
}

extension NSObject: ReuseIdentifier { }
extension NSObject {
    func getImage(_ imageView: UIImageView, url: String){
        let url = URL(string: url)!
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            placeholder: nil,
            options: [.transition(.fade(1.2))],
            completionHandler: nil
        )
    }
}
