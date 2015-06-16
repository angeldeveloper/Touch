//
//  AppDelegate.swift
//  Touch
//
//  Created by Sunil Variar on 1/27/15.
//  Copyright (c) 2015 Random Chaos Studios. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        println(__FUNCTION__)

        boolJustLaunched = true
        
//        var commonMon = CommonMonetizationClass()
        var objCommon = CommonFunctions()

        objCommon.userDefaults_createKeys()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
        //println(__FUNCTION__)
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        println(__FUNCTION__)
        
        let postNotificationObject = NSNotification(name: notificationName_applicationDidEnterBackground, object: nil)
        NSNotificationCenter.defaultCenter().postNotification(postNotificationObject)
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        println(__FUNCTION__)
        if boolJustLaunched == false {
            let postNotificationObject = NSNotification(name: notificationName_applicationDidBecomeActive, object: nil)
            NSNotificationCenter.defaultCenter().postNotification(postNotificationObject)
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        //println(__FUNCTION__)
    }


}

