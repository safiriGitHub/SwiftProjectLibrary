//
//  PopInterceptDemoVC.swift
//  SwiftProjectLibrary-Demo
//
//  Created by 张帅 on 2020/5/25.
//  Copyright © 2020 safiri. All rights reserved.
//

import UIKit

class PopInterceptDemoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "返回拦截"
        view.backgroundColor = UIColor.white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let contain = navigationController?.viewControllers.contains(self), !contain {
            print("few")
        }
    }
    
    override func shouldPopOnBackButton() -> Bool {
        alert()
        return false
    }
    
    override func willMove(toParent parent: UIViewController?) {
        if parent == nil && !poped {
            alert()
            return
        }
        super.willMove(toParent: parent)
    }
    
    var poped = false
    func alert() {
        let alertController = UIAlertController(title: "返回",
                                                message: "要返回吗?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "sure", style: .default, handler: {
            action in
            self.poped = true
            self.navigationController?.popViewController(animated: true);
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
