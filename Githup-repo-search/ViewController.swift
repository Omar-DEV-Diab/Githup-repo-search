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
    
    var array = ["sakhdk","nxz,mn,","uii9934"]
    override func viewDidLoad() {
        super.viewDidLoad()
        reposTableView.delegate = self
        reposTableView.dataSource = self
        reposTableView.allowsSelection = false
        
        searchBar.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! repoTableViewCell
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard !searchBar.text!.isEmpty else {
            return
        }
        searchQuery()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            return
        }
        searchQuery()
    }

    @objc func searchQuery() {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchQuery), object: nil)
        guard let searchText = searchBar.text else { return }
        searchService.searchForRepositories(searchText) { (response) in
            //
        }
    }
}
