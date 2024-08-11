//
//  SearchItemTableCell.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/10/24.
//

import UIKit
import Then
import SnapKit
import Kingfisher

class SearchItemTableCell: BaseTableViewCell {
    let itemImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    let title = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textAlignment = .left
        $0.numberOfLines = 1
    }
    let downloadButton = UIButton().then {
        $0.setTitle("받기", for: .normal)
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.backgroundColor = .lightGray
        $0.titleLabel?.font = .systemFont(ofSize: 18)
        $0.titleLabel?.textAlignment = .center
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 15
    }
    let star = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.tintColor = .systemBlue
        $0.backgroundColor = .white
    }
    let userRating = UILabel().then {
        $0.textColor = .gray
        $0.numberOfLines = 1
        $0.font = .systemFont(ofSize: 13)
        $0.textAlignment = .left
    }
    let artistNameLabel = UILabel().then {
        $0.textColor = .gray
        $0.numberOfLines = 1
        $0.font = .systemFont(ofSize: 13)
        $0.textAlignment = .center
    }
    let genres = UILabel().then {
        $0.textColor = .gray
        $0.numberOfLines = 1
        $0.font = .systemFont(ofSize: 13)
        $0.textAlignment = .right
    }
    let screenImage1 = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    let screenImage2 = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    let screenImage3 = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
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
        contentView.addSubview(artistNameLabel)
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
            make.trailing.equalTo(downloadButton.snp.leading).offset(10)
            make.centerY.equalTo(itemImage)

        }
        downloadButton.snp.makeConstraints { make in
            make.centerY.equalTo(itemImage)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(30)
            make.width.equalTo(70)
        }
        star.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalTo(itemImage.snp.bottom).offset(5)
            make.size.equalTo(15)
        }
        userRating.snp.makeConstraints { make in
            make.leading.equalTo(star.snp.trailing).offset(5)
            make.width.equalTo(30)
            make.centerY.equalTo(star)
        }
        artistNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(star)
            make.leading.equalTo(userRating.snp.trailing).offset(5)
            make.trailing.equalTo(genres.snp.leading).offset(5)
        }
        genres.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.centerY.equalTo(star)
        }
        screenImage1.snp.makeConstraints { make in
            make.top.equalTo(star.snp.bottom).offset(5)
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(contentView.frame.width / 2.7)
            
        }
        screenImage2.snp.makeConstraints { make in
            make.top.equalTo(star.snp.bottom).offset(5)
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalTo(screenImage1.snp.trailing).offset(10)
            make.width.equalTo(contentView.frame.width / 2.7)
            
        }
        screenImage3.snp.makeConstraints { make in
            make.top.equalTo(star.snp.bottom).offset(5)
            make.bottom.equalToSuperview().inset(20)
            make.leading.equalTo(screenImage2.snp.trailing).offset(10)
            make.width.equalTo(contentView.frame.width / 2.7)
        }
    }
    func upDateView(_ data: Results) {
        title.text = data.trackName
        self.getImage(itemImage, url: data.artworkUrl512)
        userRating.text = String(format: "%.1f", data.averageUserRating)
        genres.text = data.genres.first!
        artistNameLabel.text =  data.artistName
        getImage(screenImage1, url: data.screenshotUrls[0])
        getImage(screenImage2, url: data.screenshotUrls[1])
        getImage(screenImage3, url: data.screenshotUrls[2])
        
    }
    
}
