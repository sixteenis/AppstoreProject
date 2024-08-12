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
    let vm = SearchViewModel()
    let tableView = UITableView().then {
        $0.rowHeight = 350
        $0.separatorStyle = .none
    }
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func bindData() {
        let searchTap = searchController.searchBar.rx.searchButtonClicked
            .withLatestFrom(searchController.searchBar.rx.text.orEmpty)
            .distinctUntilChanged()
        let input = SearchViewModel.Input(searchButtinTap: searchTap)
        let output = vm.transform(input: input)
        
        output.appList
            .bind(to: tableView.rx.items(cellIdentifier: SearchItemTableCell.id, cellType: SearchItemTableCell.self)) { (row, element, cell) in
                cell.upDateView(element)
            }
            .disposed(by: disposeBag)
        
            
        
        tableView.rx.modelSelected(Results.self)
            .bind(with: self) { owner, data in
                let vc = DetailSearchViewController()
                vc.vm.model.accept(data)
                owner.navigationController?.pushViewController(vc, animated: true)
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
