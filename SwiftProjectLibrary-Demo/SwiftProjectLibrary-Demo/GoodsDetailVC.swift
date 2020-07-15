//
//  GoodsDetailVC.swift
//  LogisticsDriver
//
//  Created by pengpai on 2019/12/10.
//  Copyright © 2019 qiluys. All rights reserved.
//

import UIKit
import SwiftProjectLibrary

class GoodsDetailVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "货源详情"
        view.backgroundColor = UIColor.white
        customSystemBackItem(withImage: "nav_back")
        
        configUI()
        refreshUI()
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func configUI() {
//        let baseInfoVC = CustomCellInfoTableVC()
//        baseInfoVC.sectionHeaderTitle = "货物信息"
//        view.addSubview(baseInfoVC.view)
//        self.addChild(baseInfoVC)
//        baseInfoVC.view.snp_makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
        
    }
    func refreshUI() {
//        let baseInfoVC = CustomCellInfoTableVC()
//        
//        baseInfoVC.titleArray = ["货物名称","合理货损","货物单价"]
//        //let unitEx = gs.goodsUnit.goodsUnitEx()
//        baseInfoVC.contentArray = ["货物名称","合理货损","货物单价"]
//        
//        
//        baseInfoVC.reloadData()
        
    }
    
    
}
