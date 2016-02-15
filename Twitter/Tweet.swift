//
//  Tweet.swift
//  Twitterpated1.0
//
//  Created by Jasmine Farrell on 2/13/16.
//  Copyright © 2016 JIFarrell. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var favs: Int
    var retweets: Int?
    var profile: String?
    var likeCount: Int?
    var retweetCount: Int?
    var id: String
    var data: NSDictionary
    
    
    init(dictionary: NSDictionary) {
        data = dictionary
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        
        print(dictionary)
        
        //favs = dictionary["favorite_count"] as? String
        favs = dictionary["favorite_count"] as! Int
        retweets = dictionary["retweet_count"] as! Int
        profile = dictionary["profile_image_url"] as? String
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
        
        
        id = String(dictionary["id"]!)
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in array {
            tweets.append(Tweet(dictionary: dictionary))
        }
        
        return tweets
    }
   
}
