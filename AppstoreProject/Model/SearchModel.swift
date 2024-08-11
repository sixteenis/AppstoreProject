//
//  SearchModel.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/10/24.
//

import Foundation

struct SearchModel {
    let name: String
    let imageurl: [String]
    let artistName: String
    let genres: [String]
    let userRating: Double
    let releaseNotes: String
    let description: String
    let version: String
    init(_ dto: Results) {
        self.name = dto.trackName
        self.imageurl = dto.screenshotUrls
        self.artistName = dto.artistName
        self.genres = dto.genres
        self.userRating = dto.averageUserRating
        self.releaseNotes = dto.releaseNotes
        self.description = dto.description
        self.version = dto.version
    }
}


//struct SearchDTO: Decodable {
//    let results: [Results]
//}
//
//struct Results: Decodable {
//    let trackName: String
//    let screenshotUrls: [String]
//    let sellerName: String
//    let genres: [String]
//    let averageUserRating: Double
//    let releaseNotes: String
//    let description: String
//    let version: String
//}
