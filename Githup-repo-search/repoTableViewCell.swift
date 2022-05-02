//
//  repoTableViewCell.swift
//  Githup-repo-search
//
//  Created by Omar Diab on 4/29/22.
//

import UIKit

class repoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var starCountLbl: UILabel!
    @IBOutlet weak var forkCountLbl: UILabel!
    @IBOutlet weak var ownerProfileImage: UIImageView!
    @IBOutlet weak var ownerName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
                
        fullNameLbl.numberOfLines = 0
        fullNameLbl.adjustsFontSizeToFitWidth = true
        
        descriptionLbl.numberOfLines = 0
        descriptionLbl.adjustsFontSizeToFitWidth = true
        
        ownerName.numberOfLines = 0
        ownerName.adjustsFontSizeToFitWidth = true
    }
    
    }
    
    func populateCell(_ repo: item) {
        nameLabel.text = repo.name
        fullNameLbl.text = repo.full_name
        descriptionLbl.text = repo.description
        starCountLbl.text = repo.stargazers_count?.codingKey.stringValue
        forkCountLbl.text = repo.forks_count?.codingKey.stringValue
    }
    

}
