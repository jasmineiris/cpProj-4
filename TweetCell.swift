//
//  TweetCell.swift
//  Twitterpated1.0
//
//  Created by Jasmine Farrell on 2/13/16.
//  Copyright © 2016 JIFarrell. All rights reserved.
//

import UIKit
import AFNetworking

class TweetCell: UITableViewCell {
    var tweetid: String = ""
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var favsCountLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var replyIcon: UIImageView!

    
    var tweet: Tweet! {
        didSet {
            tweetLabel.text = tweet.text
            nameLabel.text = tweet.user!.name
            usernameLabel.text = "@\(tweet.user!.screenname!)"
            thumbImageView.setImageWithURL(tweet.user!.profileImageUrl!)
            timeLabel.text = calculateTimeStamp(tweet.createdAt!.timeIntervalSinceNow)
            retweetCountLabel.text = NSString(format:"%d", tweet.retweets!) as String
            print(tweet.retweets)
            favsCountLabel.text = NSString(format: "%d", tweet.favs) as String
            print(tweet.favs)
            print(tweet.data["favorited"])
            tweetid = tweet.id
            
            if tweet.data["favorited"] as! Bool == false {
                favButton.setImage(UIImage(named: "like-action.png"), forState: UIControlState.Normal)
            } else {
                favButton.setImage(UIImage(named: "like-action-on.png"), forState: UIControlState.Normal)
            }
            
            
        }
    }
    
    func calculateTimeStamp(timeTweetPostedAgo: NSTimeInterval) -> String {
        // Turn timeTweetPostedAgo into seconds, minutes, hours, days, or years
        var rawTime = Int(timeTweetPostedAgo)
        var time: Int = 0
        var timeChar = ""
        
        rawTime = rawTime * (-1)
        
        if (rawTime <= 60) { // SECONDS
            time = rawTime
            timeChar = "s"
        } else if ((rawTime/60) <= 60) { // MINUTES
            time = rawTime/60
            timeChar = "m"
        } else if (rawTime/60/60 <= 24) { // HOURS
            time = rawTime/60/60
            timeChar = "h"
        } else if (rawTime/60/60/24 <= 365) { // DAYS
            time = rawTime/60/60/24
            timeChar = "d"
        } else if (rawTime/(3153600) <= 1) { // YEARS
            time = rawTime/60/60/24/365
            timeChar = "y"
        }
        
        return "\(time)\(timeChar)"
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thumbImageView.layer.cornerRadius = 9
        thumbImageView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    @IBAction func retweetAction(sender: AnyObject) {
        print("rt")
        TwitterClient.sharedInstance.retweet(Int(tweetid)!, params: nil, completion: {(error) -> () in
            self.retweetButton.setImage(UIImage(named: "retweet-action-on-pressed.png"), forState: UIControlState.Normal)
            
            if self.retweetCountLabel.text! > "0" {
                self.retweetCountLabel.text = String(self.tweet.retweetCount! + 1)
            } else {
                self.retweetCountLabel.hidden = false
                self.retweetCountLabel.text = String(self.tweet.retweetCount! + 1)
            }
        })

        
        
    }
    
    
    
    @IBAction func favAction(sender: AnyObject) {
        print("fav")
        TwitterClient.sharedInstance.likeTweet(Int(tweetid)!, params: nil, completion: {(error) -> () in
            self.favButton.setImage(UIImage(named: "like-action-on.png"), forState: UIControlState.Normal)
            
            if self.favsCountLabel.text! > "0" {
                self.favsCountLabel.text = String(self.tweet.favs + 1)
            } else {
                self.favsCountLabel.hidden = false
                self.favsCountLabel.text = String(self.tweet.favs + 1)
            }
        })
    }
}

