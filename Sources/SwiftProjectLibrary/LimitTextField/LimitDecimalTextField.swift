//
//  LimitDecimalTextField.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/3/26.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

/// 小数输入框：只能输入数字和“.” ,并可限制输入小数点后几位
public class LimitDecimalTextField: LimitTextField {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        decimal()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        decimal()
    }
    
    /// 小数点后几位
    public var numberAfterPoint: Int = 3
    
    //TODO: 就算调出第三方键盘，也能控制输入
    public func decimal() {
        //keyboardType = .decimalPad 加上这行代码后，会调出第三方键盘。不知为何？ 目前暂时在xib中选decimalPad
        regularLimitTypeCb = { .RegularDecimalNumbers }
        customOperationCb = { [weak self] (result, inputString) in
            var str = result
            if let last = str.last {
             
                if ((last >= "0" && last <= "9") || last == ".") {
                    
                    if last == "." {
                        // 只能有一个小数点
                        let count = str.components(separatedBy: ".").count
                        if count == 2 {
                            if str.hasPrefix(".") {//如果第一位是.则前面加上0.
                                str = "0"+String(last)
                            }
                            
                        }else { // 只能有一个小数点
                            str = String(str.prefix(str.count-1))
                        }
                    }
                    
                    
                    // 小数点后最多能输入两位
                    if str.contains(".") {
                        if let strs = str.components(separatedBy: ".").last, let num = self?.numberAfterPoint {
                            if strs.count > num {
                                str = String(str.prefix(str.count-1))
                            }
                        }
                        
                    }
                    
                }else {
                    //不能输入.0-9以外的字符
                    str = String(str.prefix(str.count-1))
                }
                
            }
            return str
        }
    }
   
}
