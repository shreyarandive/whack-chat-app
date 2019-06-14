//
//  AddChannelVC.swift
//  Whack
//
//  Created by Shreya Randive on 6/13/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var chanNameTxt: UITextField!
    @IBOutlet weak var chanDescTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func donePressed(_ sender: Any) {
        guard let channelName = chanNameTxt.text, chanNameTxt.text != "" else { return }
        guard let channelDesc = chanDescTxt.text else { return }
        SocketService.instance.addChannel(channelName: channelName, channelDesc: channelDesc) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        chanNameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor : whackPurplePlaceHolder])
        chanDescTxt.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor : whackPurplePlaceHolder])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
