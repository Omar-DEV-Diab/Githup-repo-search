//
//  searchResponse.swift
//  Githup-repo-search
//
//  Created by Omar Diab on 4/30/22.
//

import UIKit

struct item: Codable {
    let name:String
    let full_name:String
    let description: String?
    let stargazers_count:Int?
    let forks_count:Int?
    let owner: owner
}

class owner: NSObject, Codable {
    var login:String?
    var avatar_url:String?
    @objc dynamic var image: UIImage?
    
    private enum CodingKeys : String, CodingKey { case login, avatar_url }
    
    required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        login = try container.decode(String.self, forKey: .login)
        avatar_url = try container.decode(String.self, forKey: .avatar_url)
        fillImage()
    }
    
    func fillImage() {
        let urlRequest = HttpHelper.getGETRequest(avatar_url, andQueryString: nil)
        HttpService.httpSingelton.getResponseFromUrlRequest(urlRequest) { [self] (response) in
            image = UIImage(data: (response?.response)!)
        }
    }
}

struct searchResponse: Codable {
    let total_count:Int
    let incomplete_results:Bool
    let items: [item]
}
