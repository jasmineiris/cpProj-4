//
//  TwitterClient.swift
//  Twitterpated1.0
//
//  Created by Jasmine Farrell on 2/8/16.
//  Copyright © 2016 JIFarrell. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = ""
let twitterConsumerSecret = ""
let twitterBaseURL = NSURL (string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient (
                baseURL: twitterBaseURL,
                consumerKey: twitterConsumerKey,
                consumerSecret: twitterConsumerSecret)
        }
        
        return Static.instance
    }
    
}