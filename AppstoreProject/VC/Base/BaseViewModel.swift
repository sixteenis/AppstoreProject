//
//  BaseViewModel.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/12/24.
//

import Foundation

protocol BaseViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
