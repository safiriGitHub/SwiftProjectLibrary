//
//  UIApplication+Extension.swift
//  ChildPediatric
//
//  Created by safiri on 2018/5/13.
//  Copyright © 2018年 safiri. All rights reserved.
//

import UIKit

public extension UIApplication {
    var appBuild: String {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }
    
    static func openSetting() {
        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(settingsUrl)
            }
        }
    }
}
