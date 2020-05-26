//
//  BaseNavigationController.swift
//  ChildPediatric
//
//  Created by safiri on 2018/4/14.
//  Copyright © 2018年 safiri. All rights reserved.
//

import UIKit

public class BaseNavigationController: UINavigationController, UINavigationBarDelegate, UINavigationControllerDelegate {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var rootViewController: UIViewController? {
        didSet {
            self.delegate = self
        }
    }
    
    public func navigationBar(_ navigationBar: UINavigationBar, didPush item: UINavigationItem) {
        //print("didPush")
    }

    public func navigationBar(_ navigationBar: UINavigationBar, shouldPush item: UINavigationItem) -> Bool {
        //print("shouldPush")
        return true
    }

    public func navigationBar(_ navigationBar: UINavigationBar, didPop item: UINavigationItem) {
        //print("didPop")
    }

    public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        //print("shouldPop")
        guard let items = navigationBar.items else {
            return false
        }

        if viewControllers.count < items.count {
            return true
        }

        var shouldPop = true
        if let vc = topViewController, vc.responds(to: #selector(UIViewController.shouldPopOnBackButton)){
            shouldPop = vc.shouldPopOnBackButton()
        }
        return shouldPop
    }
    
    
    // 重写 push 操作
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 控制状态栏颜色
    public override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
    
}

/// Handle UINavigationBar's 'Back' button action
protocol UINavigationBarBackButtonHandler {
    func shouldPopOnBackButton() -> Bool
}

extension UIViewController: UINavigationBarBackButtonHandler {
    @objc func shouldPopOnBackButton() -> Bool {
        return true
    }
}
// 实现拦截代码见 SwiftProjectLibrary-Demo/PopInterceptDemoVC.swift

