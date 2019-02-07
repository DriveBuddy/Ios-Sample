//
//  AppDelegate.swift
//  DriveBuddyTestProject
//
//  Created by Çağlar Uslu on 30.10.2018.
//  Copyright © 2018 Çağlar Uslu. All rights reserved.
//

import UIKit
import DriveBuddySDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, DriveBuddyDelegate {
    
    func driveBuddyNeedsLocationAlwaysUsePermission() {
        //  You should promt the user about the missing permission, and redirect them to **your app's settings panel** in **Settings application**.
    }
    
    func driveBuddyNeedsMotionPermission() {
        //  You should promt the user about the missing permission, and redirect them to **your app's settings panel** in **Settings application**.
    }
    
    func driveBuddyAuthenticationFailed() {
        // Fired when DriveBuddy SDK could not authenticate itself.
    }
    

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        DriveBuddy.set(delegate: self)
        DriveBuddy.restore()
        
        // Authentication is persistent. You can directly enable SDK if authentication status is '.Authenticated'. Check docs for implementation.
        
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

