//
//  ViewController.swift
//  Wayward Raiders
//
//  Created by Danny Perski on 3/12/16.
//  Copyright © 2016 Danny Perski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func switchView() {
        performSegueWithIdentifier("toGameplay", sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let triggerTime = (Int64(NSEC_PER_SEC) * 3)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
            self.switchView()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

