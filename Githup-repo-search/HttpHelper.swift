//
//  HttpHelper.swift
//  Githup-repo-search
//
//  Created by Omar Diab on 4/29/22.
//

import Foundation

class HttpHelper{
    class func getGETRequest(_ url: String?, andQueryString queryString: String?) -> URLRequest? {
        guard url != nil, queryString != nil else{
            return nil
        }
        let urlRequest = NSMutableURLRequest()
        urlRequest.url = URL(string: self.buildUrl(withParameter: url!, withQueryString: queryString!))
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("no-cache", forHTTPHeaderField: "Cache-Control")
        urlRequest.addValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        return urlRequest as URLRequest
    }
    
    class func buildUrl(withParameter url: String, withQueryString queryString: String) -> String {
        return "\(url)?q=\(queryString)&sort=stars&order=desc)"
    }

}
