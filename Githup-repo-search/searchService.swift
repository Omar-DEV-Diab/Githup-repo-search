//
//  searchService.swift
//  Githup-repo-search
//
//  Created by Omar Diab on 4/29/22.
//

import Foundation

class searchService{
    
    static let searchUrl = "https://api.github.com/search/repositories"
    
    class func searchForRepositories(_ name: String, completion: @escaping ((Array<Any>)?)->()) {
        HttpService.httpSingelton.getResponseFromUrl(searchUrl, andQueryString: name) { response in
            completion(nil)
        }
    }
}
