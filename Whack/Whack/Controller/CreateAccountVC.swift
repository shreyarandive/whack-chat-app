//
//  CreateAccountVC.swift
//  Whack
//
//  Created by Shreya Randive on 6/8/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else {
            return
        }
        
        guard let pwd = passwordTxt.text, passwordTxt.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: pwd) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pwd, completion: { (success) in
                    if success {
                        print("logged in!!!", AuthService.instance.authToken)
                    }
                })
            }
            else {
                print(":((((((((((((((((((")
            }
        }
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) {
    }
    
    @IBAction func generateBckgrndPressess(_ sender: Any) {
    }
}
