//
//  DetailSearchViewController.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/11/24.
//

import UIKit
import RxSwift
import RxCocoa

import SnapKit
import Then
import Kingfisher

class DetailSearchViewController: BaseViewController {
    let scrollView = UIScrollView().then {
        $0.backgroundColor = .white
    }
    let contentView = UIView()
    
    let itemImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    let itemTitle = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textAlignment = .left
        $0.numberOfLines = 1
    }
    let artistNameLabel = UILabel().then {
        $0.textColor = .gray
        $0.numberOfLines = 1
        $0.font = .systemFont(ofSize: 13)
        $0.textAlignment = .left
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
    let releaseNote = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.backgroundColor = .white
    }
    let exImage = UIImageView()
    
    let descriptionView = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpContentViewLayout()
        updateView()
    }
    override func setUpHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(itemImage)
        contentView.addSubview(itemTitle)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(downloadButton)
        contentView.addSubview(releaseNote)
        contentView.addSubview(exImage)
        contentView.addSubview(descriptionView)
    }
    override func setUpLayout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView.snp.width)
            make.edges.equalTo(scrollView)
        }
    }
    func setUpContentViewLayout() {
        itemImage.snp.makeConstraints { make in
            make.top.leading.equalTo(contentView).inset(10)
            make.size.equalTo(100)
        }
        itemTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(15)
            make.leading.equalTo(itemImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        artistNameLabel.snp.makeConstraints { make in
            make.top.equalTo(itemTitle.snp.bottom).offset(10)
            make.leading.equalTo(itemImage.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        downloadButton.snp.makeConstraints { make in
            make.top.equalTo(artistNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(itemImage.snp.trailing).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(65)
        }
        releaseNote.snp.makeConstraints { make in
            make.top.equalTo(itemImage.snp.bottom).offset(25)
            make.horizontalEdges.equalToSuperview().inset(10)
        }
        exImage.snp.makeConstraints { make in
            make.top.equalTo(releaseNote.snp.bottom).offset(15)
            make.height.equalTo(200)
            make.width.equalTo(100)
        }
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(exImage.snp.bottom).offset(15)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(20)
        }
        
    }
    override func setUpView() {
        contentView.backgroundColor = .white
    }
    func updateView() {
        itemImage.image = UIImage(systemName: "star")
        itemTitle.text = "감자국"
        artistNameLabel.text = "감자국 회사"
        releaseNote.text = "alskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓalskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓalskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓalskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓalskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓalskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓ"
        exImage.image = UIImage(systemName: "star")
        descriptionView.text = "alskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓalskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓalskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓalskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓalskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓalskdjklasjdkzjvkxchvkzxjchvkljzxhcvkjhzxckjvhxckjvhkxjcvhkjxcvhzxckvjhzx\nzxkljclkjahdsoigfahsdlkjfhjasdlkjfhasdkljfhaskdljfhalskjdfhakjsdf\nkaㅓㄴ이ㅏㄴㅇㄴ얼;ㅣㅏㅁ넝ㄹ;ㅣㅏㄴ얼;ㅁㄴ어리;ㅏㅁ넝ㄹ;ㅓㅁㄴ암ㄴㅇ\nㅁ노아ㅓㅁ노아ㅓㅁ노아ㅓ"
        
    }
}
