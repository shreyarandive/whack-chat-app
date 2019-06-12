//
//  AvatarPickerVC.swift
//  Whack
//
//  Created by Shreya Randive on 6/11/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segControl: UISegmentedControl!
    
    //variables
    var avatarType = AvatarType.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        } else {
            return AvatarCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark {
            UserDataService.instance.setAvatarName(name: "dark\(indexPath.item)")
        } else {
            UserDataService.instance.setAvatarName(name: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bckBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segControlChanged(_ sender: Any) {
        if segControl.selectedSegmentIndex == 0 {
            avatarType = AvatarType.dark
        } else {
            avatarType = .light
        }
        
        collectionView.reloadData()
    }
}
