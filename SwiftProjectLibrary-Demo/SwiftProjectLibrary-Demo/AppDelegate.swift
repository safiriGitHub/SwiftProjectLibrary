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
        
//        window?.rootViewController = BaseNavigationController(rootViewController: ViewController())
//        window?.makeKeyAndVisible()
        
        networkListening()
        return true
    }



}

func networkListening() {
    AlamofireReachability.reachability.startListening { (status) in
        switch status {
        case .notReachable:
            print("无网络") // WiFi关闭+4G关闭、飞行模式、蜂窝权限关闭
        case .unknown:
            print("未知网络")
        case .reachable(let type):
            if type == .ethernetOrWiFi {
                print("ethernetOrWiFi")
            }else if type == .wwan {
                print("wwan") // 4G的时候打印了
            }
        }
    }
}
