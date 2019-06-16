//
//  MessageCell.swift
//  Whack
//
//  Created by Shreya Randive on 6/16/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var usrImg: UIImageView!
    @IBOutlet weak var messageTxt: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(message: Message) {
        messageTxt.text = message.message
        userName.text = message.name
        usrImg.image = UIImage(named: message.avatarName)
        usrImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.avatarColor)
    }
}
