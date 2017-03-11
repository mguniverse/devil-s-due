//
//  RandomEdges.swift
//  Devil's Due
//
//  Created by Danny Perski on 9/4/16.
//  Copyright © 2016 Danny Perski. All rights reserved.
//

import UIKit

func randomizeEdges() -> UIImage? {
    let edgerand = arc4random() % 10
    
    switch edgerand {
    case 0: return UIImage(named: "bricks-2.png")
    case 1: return UIImage(named: "bricks-3.png")
    case 2: return UIImage(named: "bricks-4.png")
    default: return UIImage(named: "bricks-1.png")
    }
}
