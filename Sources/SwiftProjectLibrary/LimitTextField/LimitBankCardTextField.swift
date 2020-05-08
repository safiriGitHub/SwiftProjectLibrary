//
//  LimitBankCardTextField.swift
//  LogisticsCargoOwner
//
//  Created by pengpai on 2020/3/26.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit
/// 银行卡号输入限制: 4位自动加空格，还有bug待修复：如移动输入坐标后输入，就无法自动加空格了
public class LimitBankCardTextField: LimitTextField {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        bankcard()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        bankcard()
    }
    
    
    public func bankcard() {
        keyboardType = .numberPad //加上这行代码后，会调出第三方键盘。不知为何？ 目前暂时在xib中选numberPad
        regularLimitTypeCb = { .RegularDecimalNumbers }
        customOperationCb = { (result, inputString) in
            //var str = result
            let trim = result.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
            return trim.insert(" ", step: 4)
        }
//        customOperationCb = { (lastOprationStr, inputString) in
//            var str = inputString
//            if lastOprationStr.count < str.count, let last = str.last {
//
//                if str.count - lastOprationStr.count == 1 {
//                    if ((last >= "0" && last <= "9")) {
//                        let trim = str.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
//                        if trim.count % 4 == 0 {
//                            str = str + " "
//                        }
//
//                    }else {
//                        //不能输入0-9以外的字符
//                        str = String(str.prefix(str.count-1))
//                    }
//                }
//                else {
//                    var temp = ""
//                    for c in str {
//                        temp.append(c)
//                        let trim = temp.replacingOccurrences(of: " ", with: "")
//                        if trim.count % 4 == 0 {
//                            temp.append(" ")
//                        }
//                    }
//                    str = temp
//                }
//
//            }else {
//                str = str.trimmingCharacters(in: .whitespaces)
//            }
//            return str
//        }
    }
    
}
