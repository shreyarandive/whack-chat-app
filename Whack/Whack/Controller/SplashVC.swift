//
//  SplashVC.swift
//  Whack
//
//  Created by Shreya Randive on 6/22/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if AuthService.instance.isLoggedin {
            performSegue(withIdentifier: TO_REVEAL, sender: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
}
