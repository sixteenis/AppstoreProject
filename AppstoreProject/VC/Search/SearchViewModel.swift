//
//  SearchViewModel.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/10/24.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {
    let disposeBag = DisposeBag()
    
    struct Input {
        let searchButtinTap: Observable<ControlProperty<String>.Element>
    }
    struct Output {
        let appList: Observable<[Results]>
    }
    func transform(input: Input) -> Output {
        var appList = PublishSubject<[Results]>()
        input.searchButtinTap
            .flatMap { NetworkManager.shard.callSearchData($0)}
            .subscribe(with: self) { owner, dto in
                appList.onNext(dto.results)
            }.disposed(by: disposeBag)
        return Output(appList: appList)
    }
    
}
