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

}
