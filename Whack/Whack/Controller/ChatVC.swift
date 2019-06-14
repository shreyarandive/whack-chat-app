//
//  ChatVC.swift
//  Whack
//
//  Created by Shreya Randive on 6/5/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //Outlets
    @IBOutlet weak var menuHamburgerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuHamburgerBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if AuthService.instance.isLoggedin {
            AuthService.instance.findUserByEmail { (success) in
                if success {
                    NotificationCenter.default.post(name: NOTIF_USR_DATA_DID_CHANGE, object: nil)
                }
            }
        }
        
        MessageService.instance.findChannels { (success) in
            
        }
    }
}
