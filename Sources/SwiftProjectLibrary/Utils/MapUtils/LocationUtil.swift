//
//  LocationUtil.swift
//  LogisticsDriver
//
//  Created by pengpai on 2020/3/27.
//  Copyright © 2020 qiluys. All rights reserved.
//

import Foundation

class LocationUtil {
    
    /// 根据角度计算弧度
    static func radian(d: Double) -> Double {
        return d * Double.pi/180.0
    }
    
    /// 根据弧度计算角度
    static func angle(r: Double) -> Double {
        return r * 180.0/Double.pi
    }
    
    /// 根据两点经纬度计算两点距离
    static func getDistance(lat1:Double, lng1:Double, lat2:Double, lng2:Double) -> Double {
        let EARTH_RADIUS:Double = 6378137.0 //地球半径 (单位：m)
        
        let radLat1:Double = self.radian(d: lat1)
        let radLat2:Double = self.radian(d: lat2)
        
        let radLng1:Double = self.radian(d: lng1)
        let radLng2:Double = self.radian(d: lng2)
        
        let a:Double = radLat1 - radLat2
        let b:Double = radLng1 - radLng2
        
        var s:Double = 2 * asin(sqrt(pow(sin(a/2), 2) + cos(radLat1) * cos(radLat2) * pow(sin(b/2), 2))) //google maps里面实现的算法
        s = s * EARTH_RADIUS
        return s
    }
    
    //得到了A点B点的距离 我就可以定义一个时间，然后计算出速度出来。
    
    
    //计算方位角
    static func getBearing(lat1:Double, lng1:Double, lat2:Double, lng2:Double) -> Double {
        
        var d: Double = 0
        let radLat1:Double = radian(d: lat1)
        let radLat2:Double = radian(d: lat2)
        
        let radLng1:Double = radian(d: lng1)
        let radLng2:Double = radian(d: lng2)
        
        d = sin(radLat1)*sin(radLat2)+cos(radLat1)*cos(radLat2)*cos(radLng2-radLng1);
        d = sqrt(1-d*d);
        d = cos(radLat2)*sin(radLng2-radLng1)/d;
        d = angle(r: asin(d))
        return d
    }

//    作者：小猎豹_wubangxin
//    链接：https://www.jianshu.com/p/6b03174e2ebc
//    来源：简书
//    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
}
