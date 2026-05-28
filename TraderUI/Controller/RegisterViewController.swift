//
//  RegisterViewController.swift
//  TraderUI
//
//  Created by Kelly Ruiz on 26/5/26.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameProfile: UITextField!
    
    @IBOutlet weak var emailProfile: UITextField!
    
    @IBOutlet weak var passwordProfile: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccount(_ sender: Any) {
        
        
        if validateEmail() && validateUsername() && validatePassword() {
            
            guard let username = usernameProfile.text else { return }
            guard let email = emailProfile.text else { return }
            guard let password = passwordProfile.text else { return }
            
            
            // create an object User with info
            var userAux = User(username: username, email: email, password: password)
          
            // add that object to the current data
            usersMap[email] = userAux
            
            // navigateToUserList
            //navigateToProfile(userAux)
            navigateToUserList()
            cleaningFields()
            
        }
        
        
    }
    
    func cleaningFields()
    {
        usernameProfile.text = ""
        emailProfile.text = ""
        passwordProfile.text = ""
        errorLabel.text = ""
    }
    
    func navigateToProfile(_ dummy: User){
        
        if let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController{
            
            
            profileViewController.completeUserInfo = dummy
            
            self.navigationController?.pushViewController(profileViewController, animated: true)
            
        } else {
            print("Unable to navigate to ProfileScreen")
        }
    }
    
    func navigateToUserList(){
        
        if let userListViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserListViewController") as? UserListViewController {
            
            self.navigationController?.pushViewController(userListViewController, animated: true)
        } else {
            print("Unable to got to List Screen")
            
        }
    }
    
    func validateUsername() -> Bool {
        
        if let username = usernameProfile.text {
            
            if username.isEmpty || username.count < 3  {
                errorLabel.text = "Username is so short"
                showAlert(title: "Username is so short", message: "Please, input a valid username greater than 3 letters")
                return false
            }
            
            return true
        } else {
            return false
        }
        
    }
    
    
    func validateEmail() -> Bool {
        
        if let email = emailProfile.text {
            
            if email.isEmpty || email.count < 5  {
                errorLabel.text = "Email is so short"
                showAlert(title: "Email is so short", message: "Please, input a valid email reater than 5 letters")
                return false
            }
            
            return true
        } else {
            return false
        }
        
    }
    
    func validatePassword() -> Bool {
        
        if let pass = passwordProfile.text {
            
            if pass.isEmpty || pass.count < 4  {
                errorLabel.text = "Password should be strong"
                showAlert(title: "Password Invalid", message: "Please, input a password stronger")
                return false
            }
            
            return true
        } else {
            return false
        }
        
    }
    
    func showAlert(title: String, message: String){
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonOpen = UIAlertAction(title: "On", style: .default, handler: nil)
        
        alert.addAction(buttonOpen)
        self.present(alert, animated: true, completion: nil)
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
