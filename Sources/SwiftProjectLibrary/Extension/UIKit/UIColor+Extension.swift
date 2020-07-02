//
//  UIColor+Extension.swift
//  LogisticsDriver
//
//  Created by pengpai on 2019/12/3.
//  Copyright © 2019 qiluys. All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// 颜色初始化
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a:CGFloat = 1.0) {
        if #available(iOS 10.0, *) {
            self.init(displayP3Red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
        } else {
            // Fallback on earlier versions
            self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
        }
    }
    
    /// 随机颜色
    static var randomColor: UIColor {
        return UIColor.init(red: (((CGFloat)((arc4random() % 256)) / 255.0)), green: (((CGFloat)((arc4random() % 256)) / 255.0)), blue: (((CGFloat)((arc4random() % 256)) / 255.0)), alpha: 1.0);
    }
    
    ///APP字体颜色 标题 333945
    static var appTextColor1: UIColor {
        return UIColor.init(r: 51, g: 57, b: 69)
    }
    
    ///APP字体颜色 正文 5B6469
    static var appTextColor2: UIColor {
        return UIColor.init(r: 91, g: 100, b: 105)
    }
    
    ///APP字体颜色 注释 9B9FAA
    static var appTextColor3: UIColor {
        return UIColor.init(r: 155, g: 159, b: 170)
    }
    
    ///APP字体颜色 分隔线 E8E8E8
    static var appTextColor4: UIColor {
        return UIColor.init(r: 232, g: 232, b: 232)
    }
    
    ///APP字体颜色 背景色 F5F6F7
    static var appTextColor5: UIColor {
        return UIColor.init(r: 245, g: 246, b: 247)
    }
    
    ///APP设计红 FE292B
    static var appDesignRedColor: UIColor {
        return UIColor.init(r: 254, g: 41, b: 43)
    }
    
    /// 暗红 e41937
    static var appRedColor1: UIColor {
        return UIColor(hex: "e41937")
    }
    
    ///APP设计橘黄 FF853C
    static var appDesignOrangeColor: UIColor {
        return UIColor.init(r: 255, g: 133, b: 60)
    }
    
    ///APP设计黄 FFD80E
    static var appDesignYellowColor: UIColor {
        return UIColor.init(r: 255, g: 216, b: 14)
    }
    
    ///APP设计绿 3CCC75
    static var appDesignGreenColor: UIColor {
        return UIColor.init(r: 60, g: 204, b: 117)
    }
    
}
