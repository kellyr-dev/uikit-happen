//
//  UserViewCell.swift
//  TraderUI
//
//  Created by Kelly Ruiz on 28/5/26.
//

import UIKit

class UserViewCell: UITableViewCell {
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func goToProfile(_ sender: Any) {
        
     // implement
    }
    
}
