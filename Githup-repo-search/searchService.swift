//
//  searchService.swift
//  Githup-repo-search
//
//  Created by Omar Diab on 4/29/22.
//

import Foundation

class searchService{
    
    static let searchUrl = "https://api.github.com/search/repositories"
    
    class func searchForRepositories(_ name: String, _ pageNumber: Int, completion: @escaping (([item])?)->()) {
        let queryString = "\(name)&page=\(pageNumber)&sort=stars&order=desc"
        let urlRequest = HttpHelper.getGETRequestWithAccept(searchUrl, andQueryString: queryString)
        
        HttpService.httpSingelton.getResponseFromUrlRequest(urlRequest) { response in
            guard let reposResponse = HttpService.httpSingelton.decodeJsonResponse(response, searchResponse.self) else{
                completion(nil)
                return
            }
            completion(reposResponse.items)
        }
    }
}
