//
//  ViewController.swift
//  Wayward Raiders
//
//  Created by Danny Perski on 3/12/16.
//  Copyright © 2016 Danny Perski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressView: UIProgressView!
    
    func switchView() {
        performSegue(withIdentifier: "toGameplay", sender: nil)
    }
    
    func animateProgressBar() {
        progressView.setProgress(1, animated: true)
        
        let triggerTime = (Int64(NSEC_PER_SEC) * 3)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(triggerTime) / Double(NSEC_PER_SEC), execute: { () -> Void in
            self.switchView()
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let triggerTime = (Int64(NSEC_PER_SEC) * 1)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(triggerTime) / Double(NSEC_PER_SEC), execute: { () -> Void in
            self.animateProgressBar()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

