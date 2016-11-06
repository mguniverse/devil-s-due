//
//  RandomWalls.swift
//  Devil's Due
//
//  Created by Danny Perski on 9/4/16.
//  Copyright © 2016 Danny Perski. All rights reserved.
//

import UIKit

func randomizeWalls() -> UIImage? {
    let wallrand = arc4random() % 14
    
    switch wallrand {
    case 0: return UIImage(named: "wall-2.png")
    case 1: return UIImage(named: "wall-3.png")
    case 2: return UIImage(named: "wall-4.png")
    case 3: return UIImage(named: "wall-5.png")
    case 4: return UIImage(named: "wall-6.png")
    default: return UIImage(named: "wall-1.png")
    }
}
