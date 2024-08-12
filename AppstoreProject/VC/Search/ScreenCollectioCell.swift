//
//  ScreenCollectioCell.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/11/24.
//

import UIKit
import SnapKit
class ScreenCollectioCell: BaseCollectioViewCell {
    let image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
    }
    
    func updateImage(_ url: String) {
        getImage(image, url: url)
        
    }
}

