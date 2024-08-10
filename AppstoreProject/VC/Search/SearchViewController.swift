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
    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func bindData() {
//        searchController.searchBar.rx.text
//            .bind(with: self) { ownwer, t in
//                print(t)
//            }
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
