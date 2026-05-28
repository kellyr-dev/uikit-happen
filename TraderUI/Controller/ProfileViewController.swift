//
//  ProfileViewController.swift
//  TraderUI
//
//  Created by Kelly Ruiz on 26/5/26.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var completeUserInfo : User?

    @IBOutlet weak var emailProfile: UILabel!
    @IBOutlet weak var usernameProfile: UILabel!
    @IBOutlet weak var passwordProfile: UILabel!
    
    @IBOutlet weak var passwordProfileLabel: UILabel!
    @IBOutlet weak var emailProfileLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userInfo = completeUserInfo {
            
            usernameProfile.text = userInfo.username
            emailProfileLabel.text = userInfo.email
            passwordProfileLabel.text = userInfo.password
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func logoutUser(_ sender: Any) {
        
        if let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            
            
            
            self.navigationController?.popToRootViewController(animated: true)
        } else {
            print("Unable to log out!")
        }
        
        
    }
    
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
