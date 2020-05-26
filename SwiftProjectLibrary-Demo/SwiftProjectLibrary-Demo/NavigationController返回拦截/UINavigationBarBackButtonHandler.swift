//
//  UINavigationBarBackButtonHandler.swift
//  SwiftProjectLibrary-Demo
//
//  Created by safiri on 2020/5/25.
//  Copyright © 2020 safiri. All rights reserved.
//

//import UIKit
//
///// Handle UINavigationBar's 'Back' button action
//protocol UINavigationBarBackButtonHandler {
//    func  shouldPopOnBackButton() -> Bool
//}
//
//extension UIViewController: UINavigationBarBackButtonHandler {
//    @objc func shouldPopOnBackButton() -> Bool {
//        return true
//    }
//}
//
//extension UINavigationController {
//    @objc public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool{
//        guard let items = navigationBar.items else {
//            return false
//        }
//
//        if viewControllers.count < items.count {
//            return true
//        }
//
//        var shouldPop = true
//        if let vc = topViewController, vc.responds(to: #selector(UIViewController.shouldPopOnBackButton)){
//            shouldPop = vc.shouldPopOnBackButton()
//        }
//
//        if shouldPop{
//            DispatchQueue.main.async {
//                self.popViewController(animated: true)
//            }
//        }else{
//            for aView in navigationBar.subviews{
//                if aView.alpha > 0 && aView.alpha < 1{
//                    aView.alpha = 1.0
//                }
//            }
//        }
//        return false
//    }
//}
