//
//  SearchViewController.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/10/24.
//

import UIKit

import RxSwift
import RxCocoa
import SnapKit


class SearchViewController: BaseViewController {
    let disposeBag = DisposeBag()
    let tableView = UITableView().then {
        $0.rowHeight = 330
    }
    let searchController = UISearchController(searchResultsController: nil)
    let list = Observable.just(["카카오","당근","냠냠이"])
    override func viewDidLoad() {
        super.viewDidLoad()
//        let data = NetworkManager.shard.callSearchData("카카오")
//        data.bind(with: self) { owner, data in
//            print(data.results)
//        }
    }
    override func bindData() {
//        searchController.searchBar.rx.text
//            .bind(with: self) { ownwer, t in
//                print(t)
//            }
        list
            .bind(to: tableView.rx.items(cellIdentifier: SearchItemTableCell.id, cellType: SearchItemTableCell.self)) { (row, element, cell) in
                cell.title.text = element
                cell.itemImage.image = UIImage(systemName: "star")
                cell.userRating.text = "4.5"
                cell.genres.text = "asdasdasd"
                cell.screenImage1.image = UIImage(systemName: "star")
                cell.screenImage2.image = UIImage(systemName: "star")
                cell.screenImage3.image = UIImage(systemName: "star")
            }.disposed(by: disposeBag)
    }
    override func setUpHierarchy() {
        view.addSubview(tableView)
        tableView.register(SearchItemTableCell.self, forCellReuseIdentifier: SearchItemTableCell.id)
    }
    override func setUpLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
        }
    }
    override func setUpView() {
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "검색"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
