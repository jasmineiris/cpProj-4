//
//  ViewController.swift
//  Twitterpated1.0
//
//  Created by Jasmine Farrell on 2/8/16.
//  Copyright © 2016 JIFarrell. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(sender: AnyObject) {
        TwitterClient.sharedInstance.loginWithCompletion() {
            (user: User?, error: NSError?) in
            if user != nil {
                // perform segue
                print("performing login segue")
                self.performSegueWithIdentifier("loginToCell", sender: self)
            } else {
                // handle login error
            }
        }
        
    }

}

