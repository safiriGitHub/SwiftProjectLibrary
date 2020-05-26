//
//  ZSNavigationController.swift
//  SwiftProjectLibrary-Demo
//
//  Created by safiri on 2020/5/25.
//  Copyright © 2020 safiri. All rights reserved.
//

import UIKit

/// Handle UINavigationBar's 'Back' button action
//protocol UINavigationBarBackButtonHandler {
//    func shouldPopOnBackButton() -> Bool
//}
//
//extension UIViewController: UINavigationBarBackButtonHandler {
//    @objc func shouldPopOnBackButton() -> Bool {
//        return true
//    }
//}
//
//class ZSNavigationController: UINavigationController, UINavigationControllerDelegate, UINavigationBarDelegate {
//    
//    var rootViewController: UIViewController? {
//        didSet {
//            self.delegate = self
//        }
//    }
//
//    func navigationBar(_ navigationBar: UINavigationBar, didPush item: UINavigationItem) {
//        // working
//        print("didPush")
//    }
//
//    func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
//        // working
//        print("shouldPush")
//        return true
//    }
//
//    func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
//        print("didPop")
//        // working
//    }
//
//    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
//        print("shouldPop")
//        // working
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
//        return shouldPop
//    }
//    
//}
