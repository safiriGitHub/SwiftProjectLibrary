//
//  AppDelegate.swift
//  SwiftProjectLibrary-Demo
//
//  Created by pengpai on 2020/3/28.
//  Copyright © 2020 safiri. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.rootViewController = GoodsDetailVC()
        window?.makeKeyAndVisible()
        return true
    }



}

