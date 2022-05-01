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
}

struct searchResponse: Codable {
    let total_count:Int
    let incomplete_results:Bool
    let items: [item]
}
