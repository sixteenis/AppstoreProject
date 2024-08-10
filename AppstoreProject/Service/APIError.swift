//
//  APIError.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/10/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case unknownResponse
    case statusError
}
