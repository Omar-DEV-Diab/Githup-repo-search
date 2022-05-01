//
//  ViewController.swift
//  Githup-repo-search
//
//  Created by Omar Diab on 4/29/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {

    @IBOutlet weak var reposTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var reposArray = [item]()
    var pageCount = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reposTableView.delegate = self
        reposTableView.dataSource = self
        reposTableView.allowsSelection = false
        
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reposArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! repoTableViewCell
        cell.populateCell(reposArray[indexPath.row])
        if indexPath.row == reposArray.count - 1 {
            loadMore()
        }
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard !searchBar.text!.isEmpty else {
            return
        }
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchQuery), object: nil)
        perform(#selector(searchQuery), with: nil, afterDelay: 0.5)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            return
        }
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchQuery), object: nil)
        perform(#selector(searchQuery), with: nil, afterDelay: 0.5)
    }

    @objc func searchQuery() {
        guard let searchText = searchBar.text else { return }
        searchService.searchForRepositories(searchText, pageCount) { [self] (response) in
            guard response != nil else{
                return
            }
            reposArray = response!
            reposTableView.reloadData()
        }
    }
    
    func loadMore() {
        pageCount += 1
        searchService.searchForRepositories(searchBar.text!, pageCount) { [self] (response) in
            guard response != nil else{
                return
            }
            reposArray.append(contentsOf: response!)
            reposTableView.reloadData()
        }
    }
}

