//
//  ChannelVC.swift
//  Whack
//
//  Created by Shreya Randive on 6/5/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var usrImg: CircleImage!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USR_DATA_DID_CHANGE, object: nil)
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedin {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
            
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedin {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            usrImg.image = UIImage(named: UserDataService.instance.avatarName)
            usrImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            usrImg.image = UIImage(named: "menuProfileIcon")
            usrImg.backgroundColor = UIColor.clear
        }
    }
}
