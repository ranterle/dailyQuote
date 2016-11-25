//
//  AppDelegate.swift
//  dailyquote
//
//  Created by Manu Rink on 23/10/16.
//  Copyright © 2016 byteroyal. All rights reserved.
//

import UIKit
import Foundation
import HockeySDK


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        BITHockeyManager.shared().configure(withIdentifier: "4b5540e685e047cd9e7e4d62b6e8caee")
        // Do some additional configuration if needed here
        BITHockeyManager.shared().start()
        BITHockeyManager.shared().authenticator.authenticateInstallation()
        
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
        let lastRefreshed = UserDefaults.standard.object(forKey: "lastRefreshed") as? Date
        if let refreshed = lastRefreshed {
            let calendar = NSCalendar.current
            
            let res = calendar.compare(refreshed, to: Date(), toGranularity: .day)
            
            if res == .orderedSame {
                ViewController.refreshQuotes()
                UserDefaults.standard.set(Date(), forKey: "lastRefreshed")
            }
        }
        else {
            ViewController.refreshQuotes()
            UserDefaults.standard.set(Date(), forKey: "lastRefreshed")
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
