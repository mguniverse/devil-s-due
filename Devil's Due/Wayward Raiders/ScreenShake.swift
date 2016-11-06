//
//  ScreenShake.swift
//  Devil's Due
//
//  Created by Danny Perski on 9/5/16.
//  Copyright © 2016 Danny Perski. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
}
