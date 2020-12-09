//
//  AppDelegate.swift
//  PetFinder
//
//  Created by Luke Parham on 8/31/15.
//  Copyright © 2015 Luke Parham. All rights reserved.
//
 
import UIKit
 
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
    private func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    return true
  }
  
    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    return true
  }
  
    func applicationDidEnterBackground(_ application: UIApplication) {
    MatchedPetsManager.sharedManager.archivePets()
  }
    
    func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
        return true
    }
  
}
 
