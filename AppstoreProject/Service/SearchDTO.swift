//
//  SearchDTO.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/10/24.
//

import Foundation

struct SearchDTO: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let artworkUrl512: String
    let trackName: String
    let screenshotUrls: [String]
    let artistName: String
    let genres: [String]
    let averageUserRating: Double
    let releaseNotes: String
    let description: String
    let version: String
}
