//
//  HttpService.swift
//  Githup-repo-search
//
//  Created by Omar Diab on 4/29/22.
//

import Foundation

class HttpService {
    
    var session: URLSession
    var configuration: URLSessionConfiguration
    
    static let httpSingelton = HttpService()
    
    init() {
        configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getResponseFromUrl(_ url: String?, andQueryString queryString: String?, completionHandler: @escaping (_ response: HttpResponse?) -> Void) {
        let urlRequest = HttpHelper.getGETRequest(url, andQueryString: queryString)
        if let urlRequest = urlRequest {
            session.dataTask(with: urlRequest) { data, response, error in
                completionHandler(HttpResponse.init(data, response as? HTTPURLResponse, error))
            }.resume()
        }
    }
    
    func decodeJsonResponse<T:Codable>(_ response: HttpResponse?, _ objectType:T.Type) -> T? {
        do {
            let reposResponse = try JSONDecoder().decode(objectType.self, from: (response?.response)!)
            return reposResponse
        } catch {
            print("Unable to Decode resumes (\(error))")
            return nil
        }
    }
}
