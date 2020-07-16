//
//  UIView+Snapkit.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/1/20.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// 横向添加相同宽度的子view
    /// - Parameters:
    ///   - views: 添加的子view
    ///   - height: 子view的高度
    ///   - leadingTrailing: 左右边距
    ///   - space: 子view间距
    func addHorizontallyAverageWidthViews(_ views: [UIView], height: CGFloat, leadingTrailing: CGFloat = 0, space: CGFloat = 0) {
        
        let count = views.count
        for i in 0..<count {
            addSubview(views[i])
            views[i].snp.makeConstraints { (make) in
                if i == 0 {
                    make.leading.equalToSuperview().offset(leadingTrailing)
                }else {
                    make.left.equalTo(self.subviews[i-1].snp.right).offset(space)
                    make.width.equalTo(self.subviews[i-1].snp.width)
                }
                if i == count-1 {
                    make.trailing.equalToSuperview().offset(-leadingTrailing)
                }
                make.centerY.equalToSuperview()
                make.height.equalTo(height)
            }
        }
    }
}


