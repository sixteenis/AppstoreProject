//
//  SearchItemTableCell.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/10/24.
//

import UIKit
import Then
import SnapKit

class SearchItemTableCell: BaseTableViewCell {
    let itemImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    let title = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 15)
        $0.textAlignment = .left
        $0.numberOfLines = 1
    }
    let downloadButton = UIButton().then {
        $0.setTitle("받기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.backgroundColor = .gray
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        $0.titleLabel?.textAlignment = .center
    }
    let star = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.tintColor = .systemBlue
        $0.backgroundColor = .white
    }
    let userRating = UILabel().then {
        $0.textColor = .gray
        $0.numberOfLines = 1
        $0.textAlignment = .left
    }
    let genres = UILabel().then {
        $0.textColor = .gray
        $0.numberOfLines = 1
        $0.textAlignment = .right
    }
    let screenImage1 = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    let screenImage2 = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    let screenImage3 = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    override func setUpHierarchy() {
        contentView.addSubview(itemImage)
        contentView.addSubview(title)
        contentView.addSubview(downloadButton)
        contentView.addSubview(star)
        contentView.addSubview(userRating)
        contentView.addSubview(genres)
        contentView.addSubview(screenImage1)
        contentView.addSubview(screenImage2)
        contentView.addSubview(screenImage3)
    }
    override func setUpLayout() {
        itemImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(10)
            make.size.equalTo(45)
        }
        title.snp.makeConstraints { make in
            make.leading.equalTo(itemImage.snp.trailing).offset(5)
            make.centerY.equalTo(itemImage)

        }
        downloadButton.snp.makeConstraints { make in
            make.centerY.equalTo(itemImage)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(20)
            make.width.equalTo(40)
        }
        star.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalTo(itemImage.snp.bottom).offset(5)
            make.size.equalTo(25)
        }
        userRating.snp.makeConstraints { make in
            make.leading.equalTo(star.snp.trailing).offset(5)
            make.centerY.equalTo(star)
        }
        genres.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalTo(star)
        }
        screenImage1.snp.makeConstraints { make in
            make.top.equalTo(star.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(contentView.frame.width / 2.7)
            make.height.equalTo(250)
        }
        screenImage2.snp.makeConstraints { make in
            make.top.equalTo(star.snp.bottom).offset(5)
            make.leading.equalTo(screenImage1.snp.trailing).offset(10)
            make.width.equalTo(contentView.frame.width / 2.7)
            make.height.equalTo(250)
        }
        screenImage3.snp.makeConstraints { make in
            make.top.equalTo(star.snp.bottom).offset(5)
            make.leading.equalTo(screenImage2.snp.trailing).offset(10)
            make.width.equalTo(contentView.frame.width / 2.7)
            make.height.equalTo(250)
        }
    }
    
}
