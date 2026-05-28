//
//  LoginViewController.swift
//  TraderUI
//
//  Created by Kelly Ruiz on 26/5/26.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var resultLabel: UIButton!
    @IBOutlet weak var inputUser: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginAccount(_ sender: Any) {
        
        if validateLogin(){
            
            // navigateToProfile
            if let user = inputUser.text {
                //navigateToProfile(email: user)
                navigateToUserList()
                cleaningField()
            }
            
        }
        
    }
   
    
    @IBAction func goToRegisterScreen(_ sender: Any) {
        
        if let registerViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            self.navigationController?.pushViewController(registerViewController, animated: true)
            
        } else {
            print("Unable to navigate to RegisterScreen")
        }
        
    }
    
    func validateLogin() -> Bool {
        
        if let emailUser = inputUser.text {
            
            if emailUser.isEmpty || emailUser.count < 4 {
                
                resultLabel.setTitle("Email so short", for: .normal)
                showAlert(title: "Email so short", message: "Please, input a valid email greater than 5 letters")
                return false
            }
            
            if let userInfo = usersMap[emailUser] {
                return true
            } else {
                showAlert(title: "Invalid Email!", message: "You are not registered!")
                return false
            }
            
        } else {
            print("Invalid Entry!")
            return false
        }
        
    }
    
    func navigateToUserList(){
        
        if let userListViewController = self.storyboard?.instantiateViewController(withIdentifier: "UserListViewController") as? UserListViewController {
            
            self.navigationController?.pushViewController(userListViewController, animated: true)
        } else {
            print("Unable to got to List Screen")
            
        }
    }
    
    func cleaningField(){
        
        inputUser.text = ""
        resultLabel.setTitle("", for: .normal)
    }
    
    // adding UIAlertController
    func showAlert(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonOpen = UIAlertAction(title: "On", style: .default, handler: nil)
        
        alert.addAction(buttonOpen)
        self.present(alert, animated: true, completion: nil)
    }

}
