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
    case RegularDecimalNumbers = "[^0-9.]"
    case RegularPasswordStyle1 = "[^a-zA-Z0-9-*/+.~!@#$%^&*()]"
    case RegularNoSpace = "[\\u00A0\\u0020\\u3000]"
    case RegularChineseNumbersLetters = "[^\\u4E00-\\u9FA5A-Za-z0-9]"
}
/**
 1.不间断空格\u00A0,主要用在office中,让一个单词在结尾处不会换行显示,快捷键ctrl+shift+space ;
 2.半角空格(英文符号)\u0020,代码中常用的;
 3.全角空格(中文符号)\u3000,中文文章中使用;
 */

public class LimitTextField: UITextField {
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
//        addObserver()
        self.delegate = self
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
//        addObserver()
        self.delegate = self
    }
    
//    public func addObserver() {
//
//        self.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
//    }
    
    
//    @objc public func textFieldChanged() {
//        if let _: UITextRange = self.markedTextRange {
//            print("我哦偶偶付无")
//        }
//        //非markedText才继续往下处理
//        guard let _: UITextRange = self.markedTextRange else {
//            //当前光标的位置（后面会对其做修改）
//
//            let cursorPostion = self.offset(from: self.endOfDocument, to: self.selectedTextRange?.end ?? self.endOfDocument)
//
//            var str = self.text!
//
//            //正则表达式
//            if let regular = regularLimitCb?(), !regular.isEmpty {
//               str = str.inputRegularReplace(regular: regular, with: "")
//            }
//            if let regularType = regularLimitTypeCb?() {
//                str = str.inputRegularReplace(regular: regularType.rawValue, with: "")
//            }
//
//            if let length = lengthLimitCb?(), length > 0 {
//                //如果长度超过限制则直接截断
//                if str.count > length {
//                    if str.count - lastOprationStr.count == 1 {
//                        var isLastInput = true
//                        for i in 0..<lastOprationStr.count {
//                            let char: Character = lastOprationStr[lastOprationStr.index(lastOprationStr.startIndex, offsetBy: i)]
//                            let strIndex = str.index(str.startIndex, offsetBy: i)
//                            let char2: Character = str[strIndex]
//                            if char != char2 {
//                                let range = strIndex ..< str.index(str.startIndex, offsetBy: i+1)
//                                str.replaceSubrange(range , with: "")
//                                isLastInput = false
//                                break
//                            }
//                        }
//                        if isLastInput { str = String(str.prefix(length)) }
//                    }else {
//                        str = String(str.prefix(length))
//                    }
//                }
//            }
//
//
//
//            if let bool = uppercasedLimitCb?() {
//                if bool {
//                    //转大写
//                    str = str.uppercased()
//                }else {
//                    str = str.lowercased()
//                }
//            }
//
//            //operation
//            if let op = customOperationCb {
//                str = op(lastOprationStr, str)
//            }
//
//
//            self.text = str
//            lastOprationStr = str
//            //让光标停留在正确位置
//            if let targetPostion = self.position(from: self.endOfDocument, offset: cursorPostion) {
//                self.selectedTextRange = self.textRange(from: targetPostion, to: targetPostion)
//            }
//            return
//        }
//    }
    
    //MARK: param
    /// 获取正则表达式字符串回调
    public var regularLimitCb: (()->String)?
    /// 获取正则表达式枚举回调
    public var regularLimitTypeCb: (()->RegularLimitType)?
    /// 长度限制回调
    public var lengthLimitCb: (()->Int)?
    /// 是否大小写回调
    public var uppercasedLimitCb: (()->Bool)?
    /// 自定义操作回调
    public var customOperationCb:((_ lastOperationString: String, _ inputString: String)->String)?
    
    private lazy var lastOprationStr: String = self.text!
    
}
extension LimitTextField: UITextFieldDelegate {

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        print(string)
        //系统拼音输入法的bug
        if ["➋", "➌", "➍", "➎", "➏", "➐", "➑", "➒", "☻"].contains(string) {
            return true
        }
        
        var input = string
        // 正则表达式
        if let regular = regularLimitCb?(), !regular.isEmpty {
            input = input.inputRegularReplace(regular: regular, with: "")
        }
        if let regularType = regularLimitTypeCb?() {
            input = input.inputRegularReplace(regular: regularType.rawValue, with: "")
        }

        // 大小写控制
        if let bool = uppercasedLimitCb?() {
            if bool {
                input = input.uppercased()
            }else {
                input = input.lowercased()
            }
        }


        let tt = NSString(string: self.text!)
        var count = input.count
        // length
        var result = tt.replacingCharacters(in: range, with: input) as NSString
        let selectedRange = self.selectedRange()
        if let length = lengthLimitCb?(), length > 0 {
            if result.length > length {
                result = tt
                count = 0
            }
            //result = result.substring(to: min(result.length, length)) as NSString
        }
        self.text = result as String
        lastOprationStr = result as String
        setSelectedRange(NSMakeRange(selectedRange.location+count-range.length, selectedRange.length))

        //operation
        if let op = customOperationCb {
            self.text = op(lastOprationStr, input)
        }
        
        return false
    }
    
    
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
private extension UITextField {
    static func cursorLocation(textField: UITextField, index: Int) {
        
        if let start = textField.position(from: textField.beginningOfDocument, offset: index),
            let end = textField.position(from: start, offset: 0) {
            textField.selectedTextRange = textField.textRange(from: start, to: end)
        }
        
    }
    
    func selectedRange() -> NSRange {
        if let selectedRange = selectedTextRange {
            let location = self.offset(from: beginningOfDocument, to: selectedRange.start)
            let length = self.offset(from: selectedRange.start, to: selectedRange.end)
            return NSMakeRange(location, length)
        }
        return NSMakeRange(0, 0)
    }
    
    func setSelectedRange(_ range: NSRange) {
        if let startPosition = self.position(from: beginningOfDocument, offset: range.location),
            let endPosition = self.position(from: beginningOfDocument, offset: range.location + range.length),
            let selectionRange = self.textRange(from: startPosition, to: endPosition) {
            
            self.selectedTextRange = selectionRange
        }
    }
    //https://www.jianshu.com/p/2e36fc6f7e31
    func nonMarkedText(_ textInput: UITextInput) -> String? {
        let start = textInput.beginningOfDocument
        let end = textInput.endOfDocument
        
        guard let rangeAll = textInput.textRange(from: start, to: end),
            let text = textInput.text(in: rangeAll) else {
                return nil
        }
        
        guard let markedTextRange = textInput.markedTextRange else {
            return text
        }
        
        guard let startRange = textInput.textRange(from: start, to: markedTextRange.start),
            let endRange = textInput.textRange(from: markedTextRange.end, to: end) else {
                return text
        }
        
        return (textInput.text(in: startRange) ?? "") + (textInput.text(in: endRange) ?? "")
    }
}
