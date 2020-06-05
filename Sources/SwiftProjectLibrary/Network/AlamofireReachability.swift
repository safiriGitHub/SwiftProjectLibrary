//
//  AlamofireReachability.swift
//  LogisticsCargoOwner
//
//  Created by safiri on 2020/6/5.
//  Copyright © 2020 qiluys. All rights reserved.
//

import Foundation
import Alamofire

public class AlamofireReachability {
    
    public static let reachability = AlamofireReachability()
    
    public var baiduReachabilityManager = NetworkReachabilityManager(host: "www.baidu.com")
    
    public func newworkReachability(_ manager: NetworkReachabilityManager?, reachabilityStatus: @escaping NetworkReachabilityManager.Listener) {
        
        manager?.listener = reachabilityStatus
        manager?.startListening()
        
    }
    
    public func startListening(_ listening: @escaping NetworkReachabilityManager.Listener) {
        newworkReachability(baiduReachabilityManager, reachabilityStatus: listening)
    }
}

/**
 example

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
 
 */
