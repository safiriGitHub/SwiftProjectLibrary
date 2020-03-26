//
//  LimitTextField.swift
//  LogisticsDriver
//
//  Created by pengpai on 2020/2/3.
//  Copyright © 2020 qiluys. All rights reserved.
//

import UIKit

/// 输入限制正则枚举
public enum RegularLimitType: String {
    case RegularChinese = "[^\\u4E00-\\u9FA5]"
    case RegularNumbersLetters = "[^A-Za-z0-9]"
    case RegularIdCard = "[^xX0-9]"
    case RegularNumbers = "[^0-9]"
}

public class LimitTextField: UITextField {
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addObserver()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addObserver()
    }
    
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldChanged), name: UITextField.textDidChangeNotification, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldChanged), name: UITextField.textDidEndEditingNotification, object: self)    }
    
    
    @objc func textFieldChanged() {
        
        //非markedText才继续往下处理
        guard let _: UITextRange = self.markedTextRange else {
            //当前光标的位置（后面会对其做修改）
            let cursorPostion = self.offset(from: self.endOfDocument, to: self.selectedTextRange?.end ?? self.endOfDocument)
            
            var str = self.text!
            //正则表达式
            if let regular = regularLimitCb?(), !regular.isEmpty {
               str = str.inputRegularReplace(regular: regular, with: "")
            }
            if let regularType = regularLimitTypeCb?() {
                str = str.inputRegularReplace(regular: regularType.rawValue, with: "")
            }
            
            if let length = lengthLimitCb?(), length > 0 {
                //如果长度超过限制则直接截断
                if str.count > length {
                    if str.count - lastOprationStr.count == 1 {
                        var isLastInput = true
                        for i in 0..<lastOprationStr.count {
                            let char: Character = lastOprationStr[lastOprationStr.index(lastOprationStr.startIndex, offsetBy: i)]
                            let strIndex = str.index(str.startIndex, offsetBy: i)
                            let char2: Character = str[strIndex]
                            if char != char2 {
                                let range = strIndex ..< str.index(str.startIndex, offsetBy: i+1)
                                str.replaceSubrange(range , with: "")
                                isLastInput = false
                                break
                            }
                        }
                        if isLastInput { str = String(str.prefix(length)) }
                    }else {
                        str = String(str.prefix(length))
                    }
                }
            }
            
            
            
            if let bool = uppercasedLimitCb?() {
                if bool {
                    //转大写
                    str = str.uppercased()
                }else {
                    str = str.lowercased()
                }
            }
            
            //operation
            if let op = customOperationCb {
                str = op(lastOprationStr, str)
            }
            
            
            self.text = str
            lastOprationStr = str
            //让光标停留在正确位置
            if let targetPostion = self.position(from: self.endOfDocument, offset: cursorPostion) {
                self.selectedTextRange = self.textRange(from: targetPostion, to: targetPostion)
            }
            
            return
        }
    }
    
    //MARK: param
    /// 获取正则表达式字符串回调
    var regularLimitCb: (()->String)?
    /// 获取正则表达式枚举回调
    var regularLimitTypeCb: (()->RegularLimitType)?
    /// 长度限制回调
    var lengthLimitCb: (()->Int)?
    /// 是否大小写回调
    var uppercasedLimitCb: (()->Bool)?
    /// 自定义操作回调
    var customOperationCb:((_ lastOperationString: String, _ inputString: String)->String)?
    
    private lazy var lastOprationStr: String = self.text!
    
    
}

private extension String {
    //使用正则表达式替换
    func inputRegularReplace(regular: String, with: String, options: NSRegularExpression.Options = []) -> String {
        if let regex = try? NSRegularExpression(pattern: regular, options: options) {
            return regex.stringByReplacingMatches(in: self, options: [],
            range: NSMakeRange(0, self.count),
            withTemplate: with)
        }
        return self
    
    }
}
