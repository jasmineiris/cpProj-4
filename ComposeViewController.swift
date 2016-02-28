//
//  ComposeViewController.swift
//  Twitter
//
//  Created by Jasmine Farrell on 2/14/16.
//  Copyright © 2016 David Wayman. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    let MAX_CHARACTERS_ALLOWED = 140
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var remainingCharactersLabel: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTweet(sender: AnyObject) {
        let tweetMessage = textView.text
        let escapedTweetMessage = tweetMessage.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        TwitterClient.sharedInstance.tweeting(escapedTweetMessage!, params: nil , completion: { (error) -> () in
            print("chirping")
            print(error)
        })
        
        let alert = UIAlertController(title: "Tweet", message: "Chirp Chirp!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: {action in
            self.dismissViewControllerAnimated(false, completion: nil) }
            ))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func textViewDidChange(textView: UITextView) {
        let newLength = 140 - textView.text.characters.count
        print(newLength)
        //change the value of the label
        remainingCharactersLabel.text =  "\(newLength)"
    }
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
