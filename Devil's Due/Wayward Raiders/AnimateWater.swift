//
//  AnimateWater.swift
//  Devil's Due
//
//  Created by Danny Perski on 3/1/18.
//  Copyright © 2018 Danny Perski. All rights reserved.
//

import UIKit

func animateWater() -> UIImage? {
    var waterSprites = ["water.png", "water-animated.png"]
    var images = [UIImage]()
    for i in 0..<waterSprites.count {
        images.append(UIImage(named: waterSprites[i])!)
    }
    return UIImage.animatedImage(with: images, duration: 1.5)
}
