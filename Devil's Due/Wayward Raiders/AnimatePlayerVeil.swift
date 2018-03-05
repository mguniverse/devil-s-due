//
//  AnimatePlayerVeil.swift
//  Devil's Due
//
//  Created by Danny Perski on 3/3/18.
//  Copyright © 2018 Danny Perski. All rights reserved.
//

import UIKit

func animatePlayerVeil() -> UIImage? {
    //var waterSprites = ["water-1.png", "water-2.png", "water-3.png", "water-4.png"]
    var veilSprites = ["hero-veil-1.png", "hero-veil-2.png", "hero-veil-3.png", "hero-veil-2.png", "hero-veil-1.png"]
    var images = [UIImage]()
    for i in 0..<veilSprites.count {
        images.append(UIImage(named: veilSprites[i])!)
    }
    return UIImage.animatedImage(with: images, duration: 1.5)
}
