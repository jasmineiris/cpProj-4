//
//  AppDelegate.swift
//  Twitterpated1.0
//
//  Created by Jasmine Farrell on 2/8/16.
//  Copyright © 2016 JIFarrell. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    var storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        NSLog("Before Sleep")
        sleep(1);
        NSLog("After sleep")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "userDidLogout", name: userDidLogoutNotification, object: nil)
        
        
        if User.currentUser != nil {
            // Go to logged in screen
            print("Current user detected: \(User.currentUser?.name)")
            let vc = storyboard.instantiateViewControllerWithIdentifier("TweetsNavViewController") as UIViewController
            window?.rootViewController = vc
        }
        
        return true
    }

/*class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var storyboard = UIStoryboard(name: "Main", bundle: nil)
    let tabBarController = UITabBarController()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        NSLog("Before Sleep")
        sleep(1);
        NSLog("After sleep")
        // Override point for customization after application launch.
        //UIApplication.sharedApplication().statusBarStyle = .LightContent
        //window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "userDidLogout", name: userDidLogoutNotification, object: nil)
        
        //if User.currentUser != nil {
            // Go to logged in screen
            //print("Current user detected: \(User.currentUser?.name)")
            //var vc = storyboard.instantiateViewControllerWithIdentifier("ViewController") as? UIViewController
            //window?.rootViewController = vc
            //window?.rootViewController = vc
            
 /*           let tweetsNavigationController = storyboard.instantiateInitialViewController("TweetsNavigationViewController") as!UINavigationController
            let tweetsViewController = tweetsNavigationController.topViewController as! TweetsViewController
            tweetsNavigationController.tabBarItem.title = "Home"
            tweetsNavigationController.tabBarItem.image = UIImage(named: "Home")
            //tweetsNavigationController.navigationBar.topItem?.titleView = imageView
            
            let individualViewController = storyboard.instantiateInitialViewController("IndividualViewController") as! UINavigationController
            let tweetsViewController = tweetsNavigationController.topViewController as! TweetsViewController
            individualViewController.tabBarItem.title = "Me"
            individualViewController.tabBar.image = UIImage(named: "Me")
                    
            
            tabBarController.viewControllers = [tweetsNavigationController, IndividualViewController]
            tabBarController.tabBar.tintColor = UIColor.whiteColor()
            window?.rootViewController = tabBarController
            window?.makeKeyAndVisible()*/
        }
        
        return true
    }*/
    
    func userDidLogout() {
        let vc = storyboard.instantiateInitialViewController()! as UIViewController
        window?.rootViewController = vc
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        TwitterClient.sharedInstance.openURL(url)
        return true
    }

}

