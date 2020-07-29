//
//  AppDelegate.swift
//  SegmentExample
//
//  Created by Troy Sellers on 7/29/20.
//  Copyright © 2020 Troy Sellers. All rights reserved.
//

import UIKit
import Analytics
import Segment_Appboy

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let config = SEGAnalyticsConfiguration(writeKey: "FSgSCCzN3oaUEu6doDNBPlxxkDVDeSxe")
        config.trackApplicationLifecycleEvents = true
        config.recordScreenViews = true
        config.use(SEGAppboyIntegrationFactory.instance())
        
        //config.middlewares = [BrazeDebounceMiddleware()]
        
        config.launchOptions = launchOptions
        config.flushAt = 1 //testing
        
        SEGAnalytics.setup(with: config)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

