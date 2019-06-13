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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    func setupView() {
        usrnameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: whackPurplePlaceHolder])
        passwrdTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: whackPurplePlaceHolder])
    }
}
