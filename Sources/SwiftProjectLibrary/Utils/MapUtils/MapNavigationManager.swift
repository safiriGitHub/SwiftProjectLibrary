//
//  MapNavigationManager.swift
//  LogisticsDriver
//
//  Created by pengpai on 2020/3/27.
//  Copyright © 2020 qiluys. All rights reserved.
//

import Foundation
import MapKit

/// 跳转到外部地图APP进行导航
public class MapNavigationManager {
        
    public static func mapNavigation(lat: String, lng: String, present:UIViewController) {
        
        var maps = [Dictionary<String, String>]()
        
        
        //百度地图
        if UIApplication.shared.canOpenURL(URL(string: "baidumap://")!) {
            let urlString = "baidumap://map/direction?origin={{我的位置}}&destination=latlng:\(lat),\(lng)|name=北京&mode=driving&coord_type=gcj02"
            if let url = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                let baiduMapDic = ["title": "百度地图", "url": url]
                maps.append(baiduMapDic)
            }
        }
        
        //高德地图
        if UIApplication.shared.canOpenURL(URL(string: "iosamap://")!) {
            let urlString = "iosamap://navi?sourceApplication=导航功能&backScheme=nav_LogisticsDriver&lat=\(lat)&lon=\(lng)&dev=0&style=2"
            if let url = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                let gaodeMapDic = ["title": "高德地图", "url": url]
                maps.append(gaodeMapDic)
            }
        }
        
        //谷歌地图
        if UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!) {
          
            let urlString = "comgooglemaps://?x-source=导航&x-success=nav123456&saddr=&daddr=\(lat),\(lng)&directionsmode=driving"
            if let url = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                let gaodeMapDic = ["title": "谷歌地图", "url": url]
                maps.append(gaodeMapDic)
            }
        }
        
        //腾讯地图
        if UIApplication.shared.canOpenURL(URL(string: "qqmap://")!) {
            let urlString = "qqmap://map/routeplan?from=我的位置&type=drive&tocoord=\(lat),\(lng)&to=终点&coord_type=1&policy=0"
            if let url = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                let gaodeMapDic = ["title": "腾讯地图", "url": url]
                maps.append(gaodeMapDic)
            }
        }
        
        let alert = UIAlertController(title: "选择地图", message: nil, preferredStyle: .actionSheet)
        
        //苹果原生地图-苹果原生地图方法和其他不一样
        alert.addAction(UIAlertAction(title: "苹果地图", style: .default, handler: { (_) in
            appleMapNavigation(lat: lat, lng: lng)
        }))
        
        for dic in maps {
            let titlte = dic["title"]
            if let url = dic["url"], let URL = URL(string: url) {
                let action = UIAlertAction(title: titlte, style: .default) { (_) in
                    UIApplication.shared.openURL(URL)
                }
                alert.addAction(action)
            }
            
        }
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        present.present(alert, animated: true, completion: nil)
    }
    
    //苹果地图
    public static func appleMapNavigation(lat: String, lng: String) {
        
        guard let d = Double(lat), let l = Double(lng) else {
            return
        }
        //终点坐标
        let coordinate = CLLocationCoordinate2D(latitude: d, longitude: l)
        //用户位置
        let currentLocation = MKMapItem.forCurrentLocation()
        //终点位置
        let toLocation = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary: nil))
        let dic = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,
                   MKLaunchOptionsMapTypeKey: NSNumber(value: MKMapType.standard.rawValue),
                   MKLaunchOptionsShowsTrafficKey: NSNumber(value: true)] as [String : Any]
        MKMapItem.openMaps(with: [currentLocation, toLocation], launchOptions: dic)
    }

}
