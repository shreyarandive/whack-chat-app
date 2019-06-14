//
//  ChannelVC.swift
//  Whack
//
//  Created by Shreya Randive on 6/5/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var usrImg: CircleImage!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USR_DATA_DID_CHANGE, object: nil)
        SocketService.instance.getChannel { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
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
    
    @IBAction func addChannelBtn(_ sender: Any) {
        let addchannel = AddChannelVC()
        addchannel.modalPresentationStyle = .custom
        present(addchannel, animated: true, completion: nil)
    }
    
    @objc func setupUserInfo() {
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
    
    @objc func userDataDidChange(_ notif: Notification) {
        setupUserInfo()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
