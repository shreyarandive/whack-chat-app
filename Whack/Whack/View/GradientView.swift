//
//  GradientView.swift
//  Whack
//
//  Created by Shreya Randive on 6/5/19.
//  Copyright © 2019 Shreya Randive. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var topColor : UIColor = #colorLiteral(red: 0.6235294118, green: 0.06666666667, blue: 0.07450980392, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor : UIColor = #colorLiteral(red: 0.1098039216, green: 0.1137254902, blue: 0.5294117647, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }

    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
