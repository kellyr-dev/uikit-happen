//
//  ViewController.swift
//  TraderUI
//
//  Created by Kelly Ruiz on 26/5/26.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToLoginScreen(_ sender: Any) {
        
        if let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            
            
            
            self.navigationController?.pushViewController(loginViewController, animated: true)
        } else {
            
            print("Unable to navigate to LoginScreen!")
        }
        
    }
    
}

