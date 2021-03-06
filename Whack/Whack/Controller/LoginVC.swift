//
//  LoginVC.swift
//  Whack
//
//  Created by Shreya Randive on 6/8/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usrnameTxt: UITextField!
    @IBOutlet weak var passwrdTxt: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if AuthService.instance.isLoggedin {
            performSegue(withIdentifier: LOGIN_TO_REVEAL, sender: nil)
        }
    }
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) {}
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = usrnameTxt.text, usrnameTxt.text != "" else { return }
        guard let pwd = passwrdTxt.text, passwrdTxt.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: pwd) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USR_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.performSegue(withIdentifier: LOGIN_TO_REVEAL, sender: nil)
                    }
                })
            }
        }
    }
    
    func setupView() {
        spinner.isHidden = true
        usrnameTxt.text = ""
        passwrdTxt.text = ""
        usrnameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: whackPurplePlaceHolder])
        passwrdTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: whackPurplePlaceHolder])
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
