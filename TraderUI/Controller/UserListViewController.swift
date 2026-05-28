//
//  UserListViewController.swift
//  TraderUI
//
//  Created by Kelly Ruiz on 28/5/26.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var userTable: UITableView!
    
    var userList: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userList = getListUser()
        userTable.dataSource = self
    }
    
    func getListUser() -> [User] {
        return Array(usersMap.values)
    }

}


extension UserListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserViewCell", for: indexPath) as? UserViewCell else {
            print("Was unable to cast UserViewCell")
            return UITableViewCell()
        }
        
        
        let currentUser = userList[indexPath.row]
        cell.usernameLabel.text = currentUser.username
        cell.emailLabel.text = currentUser.email
        
        
        return cell
    }
    
    
}
