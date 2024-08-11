//
//  DetailSearchViewModel.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/11/24.
//

import Foundation
import RxSwift
import RxCocoa

class DetailSearchViewModel {
    let disposeBag = DisposeBag()
    let model = BehaviorRelay<Results?>(value: nil)
//    struct Input {
//        let viewdidLoad: PublishRelay<Void>
//    }
//    struct Output {
//        let data: Observable<Results>
//    }
//    func transform() -> Output {
//        let data = model.compactMap {$0}
//        
//        
//        
//        return Output(data: data.asObservable())
//    }
}
