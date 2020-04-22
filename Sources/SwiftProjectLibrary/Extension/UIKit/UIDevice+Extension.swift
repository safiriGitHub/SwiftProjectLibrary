//
//  UIDevice+Extension.swift
//  LogisticsDriver
//
//  Created by pengpai on 2019/12/6.
//  Copyright © 2019 qiluys. All rights reserved.
//

import Foundation

public extension UIDevice {
    
    static func iPhone44S() -> Bool {
        return CGSize(width: 640, height: 960) == UIScreen.main.currentMode?.size
    }
    
    static func iPhone55S5C5E() -> Bool {
        return CGSize(width: 640, height: 1136) == UIScreen.main.currentMode?.size
    }
    
    static func iPhone66S78() -> Bool {
        return CGSize(width: 750, height: 1334) == UIScreen.main.currentMode?.size
    }
    
    static func iPhone6P6SP7P8P() -> Bool {
        return CGSize(width: 1242, height: 2208) == UIScreen.main.currentMode?.size
    }
    
    static func iPhoneXXS() -> Bool {
        return CGSize(width: 1125, height: 2436) == UIScreen.main.currentMode?.size
    }
    
    static func iPhoneXR() -> Bool {
        return CGSize(width: 828, height: 1792) == UIScreen.main.currentMode?.size
    }
    
    static func iPhoneXSMax() -> Bool {
        return CGSize(width: 1242, height: 2688) == UIScreen.main.currentMode?.size
    }
    
    static func iPhoneXSeries() -> Bool {
        return iPhoneXR() || iPhoneXXS() || iPhoneXSMax()
    }
    
    //获取设备具体详细的型号
    static var modelName: String? {
        var systemInfo = utsname()

        uname(&systemInfo)

        let machineMirror = Mirror(reflecting: systemInfo.machine)

        let deviceString = machineMirror.children.reduce("") { identifier, element in

            guard let value = element.value as? Int8, value != 0 else { return identifier }

            return identifier + String(UnicodeScalar(UInt8(value)))

        }
        return deviceString
    }
    
    //https://www.theiphonewiki.com/wiki/Models
    static func machineName() -> String {
        let deviceType = [//AirPods(耳机)
            "AirPods1,1" :  "AirPods",
            //Apple TV
            "AppleTV2,1" :  "Apple TV (2nd generation)",
            "AppleTV3,1" :  "Apple TV (3rd generation)",
            "AppleTV3,2" :  "Apple TV (3rd generation)",
            "AppleTV5,3" :  "Apple TV (4th generation)",
            "AppleTV6,2" :  "Apple TV 4K",
            //Apple Watch(手表)
            "Watch1,1" :  "Apple Watch (1st generation)",
            "Watch1,2" :  "Apple Watch (1st generation)",
            "Watch2,6" :  "Apple Watch Series 1",
            "Watch2,7" :  "Apple Watch Series 1",
            "Watch2,3" :  "Apple Watch Series 2",
            "Watch2,4" :  "Apple Watch Series 2",
            "Watch3,1" :  "Apple Watch Series 3",
            "Watch3,2" :  "Apple Watch Series 3",
            "Watch3,3" :  "Apple Watch Series 3",
            "Watch3,4" :  "Apple Watch Series 3",
            "Watch4,1" : "Apple Watch Series 4 40mm",
            "Watch4,2" : "Apple Watch Series 4 44mm",
            "Watch4,3" : "Apple Watch Series 4 40mm",
            "Watch4,4" : "Apple Watch Series 4 44mm",
            //HomePod(音响)
            "AudioAccessory1,1" :  "HomePod",
            //iPad
            "iPad1,1" : "iPad 1",
            "iPad2,1" : "iPad 2 (WiFi)",
            "iPad2,2" : "iPad 2 (GSM)",
            "iPad2,3" : "iPad 2 (CDMA)",
            "iPad2,4" : "iPad 2",
            "iPad2,5" : "iPad mini 1",
            "iPad2,6" : "iPad mini 1",
            "iPad2,7" : "iPad mini 1",
            "iPad3,1" : "iPad 3 (WiFi)",
            "iPad3,2" : "iPad 3 (4G)",
            "iPad3,3" : "iPad 3 (4G)",
            "iPad3,4" : "iPad 4",
            "iPad3,5" : "iPad 4",
            "iPad3,6" : "iPad 4",
            "iPad4,1" : "iPad Air",
            "iPad4,2" : "iPad Air",
            "iPad4,3" : "iPad Air",
            "iPad4,4" : "iPad mini 2",
            "iPad4,5" : "iPad mini 2",
            "iPad4,6" : "iPad mini 2",
            "iPad4,7" : "iPad mini 3",
            "iPad4,8" : "iPad mini 3",
            "iPad4,9" : "iPad mini 3",
            "iPad5,1" : "iPad mini 4",
            "iPad5,2" : "iPad mini 4",
            "iPad5,3" : "iPad Air 2",
            "iPad5,4" : "iPad Air 2",
            "iPad6,3" : "iPad Pro (9.7 inch)",
            "iPad6,4" : "iPad Pro (9.7 inch)",
            "iPad6,7" : "iPad Pro (12.9 inch)",
            "iPad6,8" : "iPad Pro (12.9 inch)",
            "iPad6,11" : "iPad 5",
            "iPad6,12" : "iPad 5",
            "iPad7,1" : "iPad Pro (12.9 inch 2)",
            "iPad7,2" : "iPad Pro (12.9 inch 2)",
            "iPad7,3" : "iPad Pro (10.5 inch)",
            "iPad7,4" : "iPad Pro (10.5 inch)",
            "iPad7,5" : "iPad 6",
            "iPad7,6" : "iPad 6",
            "iPad7,11" : "iPad 7",
            "iPad7,12" : "iPad 7",
            "iPad8,1" : "iPad Pro (11 inch)",
            "iPad8,2" : "iPad Pro (11 inch)",
            "iPad8,3" : "iPad Pro (11 inch)",
            "iPad8,4" : "iPad Pro (11 inch)",
            "iPad8,5" : "iPad Pro (12.9 inch 3)",
            "iPad8,6" : "iPad Pro (12.9 inch 3)",
            "iPad8,7" : "iPad Pro (12.9 inch 3)",
            "iPad8,8" : "iPad Pro (12.9 inch 3)",
            "iPad11,1" : "iPad mini 5",
            "iPad11,2" : "iPad mini 5",
            "iPad11,3" : "iPad Air 3",
            "iPad11,4" : "iPad Air 3",
            //iPhone(手机)
            "iPhone1,1" : "iPhone 1G",
            "iPhone1,2" : "iPhone 3G",
            "iPhone2,1" : "iPhone 3GS",
            "iPhone3,1" : "iPhone 4 (GSM)",
            "iPhone3,2" : "iPhone 4",
            "iPhone3,3" : "iPhone 4 (CDMA)",
            "iPhone4,1" : "iPhone 4S",
            "iPhone5,1" : "iPhone 5",
            "iPhone5,2" : "iPhone 5",
            "iPhone5,3" : "iPhone 5c",
            "iPhone5,4" : "iPhone 5c",
            "iPhone6,1" : "iPhone 5s",
            "iPhone6,2" : "iPhone 5s",
            "iPhone7,1" : "iPhone 6 Plus",
            "iPhone7,2" : "iPhone 6",
            "iPhone8,1" : "iPhone 6s",
            "iPhone8,2" : "iPhone 6s Plus",
            "iPhone8,4" : "iPhone SE",
            "iPhone9,1" : "iPhone 7",
            "iPhone9,2" : "iPhone 7 Plus",
            "iPhone9,3" : "iPhone 7",
            "iPhone9,4" : "iPhone 7 Plus",
            "iPhone10,1" : "iPhone 8",
            "iPhone10,4" : "iPhone 8",
            "iPhone10,2" : "iPhone 8 Plus",
            "iPhone10,5" : "iPhone 8 Plus",
            "iPhone10,3" : "iPhone X",
            "iPhone10,6" : "iPhone X",
            "iPhone11,8" : "iPhone XR",
            "iPhone11,2" : "iPhone XS",
            "iPhone11,4" : "iPhone XS Max",
            "iPhone11,6" : "iPhone XS Max",
            "iPhone12,1" : "iPhone 11",
            "iPhone12,3" : "iPhone 11 Pro",
            "iPhone12,5" : "iPhone 11 Pro Max",
            //iPod
            "iPod1,1"   :  "iPod touch",
            "iPod2,1"   :  "iPod touch (2nd generation)",
            "iPod3,1"   :  "iPod touch (3rd generation)",
            "iPod4,1"   :  "iPod touch (4th generation)",
            "iPod5,1"   :  "iPod touch (5th generation)",
            "iPod7,1"   :  "iPod touch (6th generation)"
        ]
        
        
        if let deviceStringKey = UIDevice.modelName {
            if deviceStringKey.hasPrefix("x86")  {
                return "iPhone模拟器，Mac"
            }
            else {
                if let deviceTypeString = deviceType[deviceStringKey] {
                    return deviceTypeString
                }
            }
        }
        
        return "iPhone新机型"
    }
}
