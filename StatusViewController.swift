//
//  StatusViewController.swift
//  Twitter
//
//  Created by Jasmine Farrell on 2/14/16.
//  Copyright © 2016 David Wayman. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {
    
    
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var numFavorites: UILabel!
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var numRetweets: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var ScreenLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var tweetImage: UIImageView!
    
    var tweet: Tweet!
    var dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Tweet"
        
        numFavorites.text = NSString(format:"%d", tweet.favs) as String
        numRetweets.text = NSString(format:"%d", tweet.retweets!) as String
        statusLabel.text = tweet.text
        
        let date = tweet.createdAt! as NSDate
        dateFormatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        dateLabel.text = dateFormatter.stringFromDate(date)
        
        ScreenLabel.text = tweet.user!.screenname!
        NameLabel.text = tweet.user!.name!
        
      //  let profile = tweet.profile!
        
    
        tweetImage.setImageWithURL(tweet.user!.profileImageUrl!)
        tweetImage.layer.cornerRadius = 9.0
        tweetImage.layer.masksToBounds = true
        

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        let nav = self.navigationController?.navigationBar
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .ScaleAspectFit
        let image = UIImage(named: "Twitter_logo_white_48")
        imageView.image = image
        navigationItem.titleView = imageView
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
