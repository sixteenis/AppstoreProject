//
//  NetworkManager.swift
//  AppstoreProject
//
//  Created by 박성민 on 8/10/24.
//

import Foundation
import RxSwift


final class NetworkManager {
    static let shard = NetworkManager()
    private init() {}
    
    func callSearchData(_ search: String) -> Observable<SearchDTO> {
        let url = APIKey.baseURL + "?country=KR&term=\(search)&media=software"
        let result = Observable<SearchDTO>.create { observer in
            guard let url = URL(string: url) else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error {
                    observer.onError(APIError.unknownResponse)
                    return
                }
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    observer.onError(APIError.statusError)
                    return
                }
                if let data = data, let appData = try? JSONDecoder().decode(SearchDTO.self, from: data){
                    observer.onNext(appData)
                    observer.onCompleted()
                } else {
                    observer.onError(APIError.unknownResponse)
                }
                
            }.resume()
            return Disposables.create()
        }.debug("통신")
        return result
    }
}
