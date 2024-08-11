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
    let disposeBag = DisposeBag()
    var vm = DetailSearchViewModel()
    
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
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
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
    lazy var screenCollection = UICollectionView(frame: .zero, collectionViewLayout: screenlayout())
    let descriptionView = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpContentViewLayout()
    }
    override func bindData() {
        vm.model
            .bind(with: self) { owner, result in
                owner.updateView(result!)
            }.disposed(by: disposeBag)
        
    }
    override func setUpHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(itemImage)
        contentView.addSubview(itemTitle)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(downloadButton)
        contentView.addSubview(releaseNote)
        contentView.addSubview(screenCollection)
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
        screenCollection.snp.makeConstraints { make in
            make.top.equalTo(releaseNote.snp.bottom).offset(15)
            make.height.equalTo(450)
            make.horizontalEdges.equalToSuperview()
        }
        descriptionView.snp.makeConstraints { make in
            make.top.equalTo(screenCollection.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(20)
        }
        
    }
    override func setUpView() {
        contentView.backgroundColor = .white
        screenCollection.delegate = self
        screenCollection.dataSource = self
        screenCollection.register(ScreenCollectioCell.self, forCellWithReuseIdentifier: ScreenCollectioCell.id)
        screenCollection.backgroundColor = .white
        screenCollection.showsHorizontalScrollIndicator = false
        screenCollection.reloadData()
        
    }
    func updateView(_ data: Results) {
        getImage(itemImage, url: data.artworkUrl512)
        itemTitle.text = data.trackName
        artistNameLabel.text = data.artistName
        releaseNote.text = "새로운 소식" + "\n\n" + "버전 \(data.version)" + "\n\n" + data.releaseNotes
        descriptionView.text = data.description
    }
}
private extension DetailSearchViewController {
    func screenlayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width// - 50 // 20 + 30
        layout.itemSize = CGSize(width: width/1.5, height: width * 2) //셀
        layout.scrollDirection = .horizontal // 가로, 세로 스크롤 설정
        //layout.minimumLineSpacing = 10
        //layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return layout
    }
}

extension DetailSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let list = vm.model.value?.screenshotUrls.count else {return 0}
        return list
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenCollectioCell.id, for: indexPath) as! ScreenCollectioCell
        let url = vm.model.value!.screenshotUrls[indexPath.row]
        cell.updateImage(url)
        return cell
    }
    
    
}
