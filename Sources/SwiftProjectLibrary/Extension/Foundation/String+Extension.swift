//
//  String+Extension.swift
//  LogisticsDriver
//
//  Created by pengpai on 2019/12/25.
//  Copyright © 2019 qiluys. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    
    /// 使用正则表达式替换
    func pregReplace(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String {
    let regex = try! NSRegularExpression(pattern: pattern, options: options)
    return regex.stringByReplacingMatches(in: self, options: [],
                                          range: NSMakeRange(0, self.count),
                                          withTemplate: with)
    
    }
    
    /// 截取字符串的小数点后指定位数
    func subStringAfterPoint(_ num: Int = 0) -> String {
        if num <= 0 {
            return self
        }else {
            var paramLongitude = self
            let arr = self.components(separatedBy: ".")
            if let last = arr.last, let first = arr.first {
                if last.count > num {
                    let str = String(last.prefix(num))
                    paramLongitude = first+"."+str
                }
            }
            return paramLongitude
        }
        
    }
    
    /// 去掉首尾空格
    var removeHeadAndTailSpace:String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    /// 去掉首尾空格 包括后面的换行 \n
    var removeHeadAndTailSpacePro:String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// 去掉所有空格
    var removeAllSapce: String {
        return self.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
    }
    /// 去掉首尾空格 后 指定开头空格数
    func beginSpaceNum(num: Int) -> String {
        var beginSpace = ""
        for _ in 0..<num {
            beginSpace += " "
        }
        return beginSpace + self.removeHeadAndTailSpacePro
    }
    
    /// 添加中划线
    func addStrikethroughStyle() -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue])
    }
    
    /// 添加下划线
    func addUnderlineStyle() -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue])
    }
    
    /// 读取字符
    subscript (_ i: Int) -> Character {
        get {
            return self[index(startIndex, offsetBy: i)]
        }
    }
    
    /// 
    func toNSRange(_ range: Range<String.Index>) -> NSRange {
        guard let from = range.lowerBound.samePosition(in: utf16), let to = range.upperBound.samePosition(in: utf16) else {
            return NSMakeRange(0, 0)
        }
        return NSMakeRange(utf16.distance(from: utf16.startIndex, to: from), utf16.distance(from: from, to: to))
    }
    
    func toRange(_ range: NSRange) -> Range<String.Index>? {
        guard let from16 = utf16.index(utf16.startIndex, offsetBy: range.location, limitedBy: utf16.endIndex) else { return nil }
        guard let to16 = utf16.index(from16, offsetBy: range.length, limitedBy: utf16.endIndex) else { return nil }
        guard let from = String.Index(from16, within: self) else { return nil }
        guard let to = String.Index(to16, within: self) else { return nil }
        return from ..< to
    }
}

public extension String {
    /// 字符串的匹配范围 方法一
    ///
    /// - Parameters:
    /// - matchStr: 要匹配的字符串
    /// - Returns: 返回所有字符串范围
    @discardableResult
    func hw_exMatchStrRange2(_ matchStr: String) -> [NSRange] {
        var allLocation = [Int]() //所有起点
        let matchStrLength = (matchStr as NSString).length  //currStr.characters.count 不能正确统计表情

        let arrayStr = self.components(separatedBy: matchStr)//self.componentsSeparatedByString(matchStr)
        var currLoc = 0
        arrayStr.forEach { currStr in
            currLoc += (currStr as NSString).length
            allLocation.append(currLoc)
            currLoc += matchStrLength
        }
        allLocation.removeLast()
        return allLocation.map { NSRange(location: $0, length: matchStrLength) } //可把这段放在循环体里面，同步处理，减少再次遍历的耗时
    }
    
    /// 字符串的匹配范围 方法二(推荐)
    ///
    /// - Parameters:
    ///     - matchStr: 要匹配的字符串
    /// - Returns: 返回所有字符串范围
    @discardableResult
    func hw_exMatchStrRange(_ matchStr: String) -> [NSRange] {
        var selfStr = self as NSString
        var withStr = Array(repeating: "X", count: (matchStr as NSString).length).joined(separator: "") //辅助字符串
        if matchStr == withStr { withStr = withStr.lowercased() } //临时处理辅助字符串差错
        var allRange = [NSRange]()
        while selfStr.range(of: matchStr).location != NSNotFound {
            let range = selfStr.range(of: matchStr)
            allRange.append(NSRange(location: range.location,length: range.length))
            selfStr = selfStr.replacingCharacters(in: NSMakeRange(range.location, range.length), with: withStr) as NSString
        }
        return allRange
    }
}
