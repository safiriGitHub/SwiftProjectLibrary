//
//  File.swift
//  
//
//  Created by pengpai on 2020/3/24.
//

import Foundation

public struct RegexHelper {
    
    public let regex: NSRegularExpression
    
    public init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    public func match(_ input: String) -> Bool {
        let matches = regex.matches(in: input, options: [], range: NSMakeRange(0, input.utf16.count))
        return matches.count > 0
    }
    
}

//swift 中新加操作符的时候需要先对其进行声明，告诉编译器这个符合其实是一个操作符合
//precedencegroup 定义了一个操作符的优先级别
//precedencegroup MatchPrecedence {
//    //associativity 定义了结合定律，多个同类操作符顺序出现的计算顺序
//    associativity: none
//    //higherThan 运算的优先级
//    higherThan: DefaultPrecedence
//}

//infix 表示定位的是一个中位操作符，意思是前后都是输入；
//其他的修饰子还包括prefix和postfix
infix operator =~~ : MultiplicationPrecedence

public func =~~(object: String, template: String) -> Bool {
    do {
        return try RegexHelper(template).match(object)
    } catch _ {
        return false
    }
}

public func =~~(object: String, regexType: RegexType) -> Bool {
    do {
        return try RegexHelper(regexType.rawValue).match(object)
    } catch _ {
        return false
    }
}

public enum RegexType : String {
    case RegexMail = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
    case RegexUsername = "^[a-z0-9_-]{4,16}$"
    case RegexPassword1 = "^[a-zA-Z0-9-*/+.~!@#$%^&*()]{6,20}$"
    
    /// 密码至少包含 数字和英文，长度6-20
    case RegexPassword2 = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$"
    
    /// 密码包含 数字,英文,字符中的两种以上，长度6-20
    case RegexPassword3 = "^(?![0-9]+$)(?![a-z]+$)(?![A-Z]+$)(?!([^(0-9a-zA-Z)])+$).{6,20}$"
    
    /// 密码至少包含数字跟字母，可以有字符
    case RegexPassword4 = "(?=.*([a-zA-Z].*))(?=.*[0-9].*)[a-zA-Z0-9-*/+.~!@#$%^&*()]{6,20}$"

    /// 匹配16进制
    case RegexHexValue = "^#?([a-f0-9]{6}|[a-f0-9]{3})$"

    /// 匹配URL
    case RegexURL = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"

    /// 匹配IP地址
    case RegexIPAddress = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"

    /// 是HTML <center>内容<\center>  符合
    case RegexHTMLTag = "^<([a-z]+)([^<]+)*(?:>(.*)<\\/\\1>|\\s+\\/>)$"

    /// 日期(年-月-日)
    case RegexDate1 = "(\\d{4}|\\d{2})-((1[0-2])|(0?[1-9]))-(([12][0-9])|(3[01])|(0?[1-9]))"

    /// 日期(月/日/年)
    case RegexDate2 = "((1[0-2])|(0?[1-9]))/(([12][0-9])|(3[01])|(0?[1-9]))/(\\d{4}|\\d{2})"

    /// 时间(小时:分钟, 24小时制)
    case RegexTimeFormat = "((1|0?)[0-9]|2[0-3]):([0-5][0-9])"

    /// 是汉字
    case RegexisChinese = "[\\u4e00-\\u9fa5]"

    /// 中文及全角标点符号(字符)
    case RegexChineseParagraph = "[\\u3000-\\u301e\\ufe10-\\ufe19\\ufe30-\\ufe44\\ufe50-\\ufe6b\\uff01-\\uffee]"

    /// 电话号码
    case RegexFixedLineTelephone = "^(0\\d{2,3}\\-)?([2-9]\\d{6,7})+(\\-\\d{1,6})?$"

    /// 中国大陆身份证号18位
    case RegexIdNum = "^(\\d{6})(\\d{4})(\\d{2})(\\d{2})(\\d{3})([0-9]|X)$"

    /// 手机号
    case RegexPhoneNum = "^(13[0-9]|14[5-9]|15[0-3,5-9]|16[2,5,6,7]|17[0-8]|18[0-9]|19[0-3,5-9])\\d{8}$"

    /// 邮政编码
    case RegexZipCode = "[1-9]\\d{5}"

    /// 大于0的整数
    case RegexInteger = "[1-9]\\d"

    /// 字母
    case RegexLetter  = "^[A-Z]+$"
    
    /// 燃油车牌和新能源车牌
    case RegexCarHphm = "^([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4,5}[A-Z0-9挂学警港澳专]{1})*$"
    
    /// 一般类型车牌号
    case RegexHphm = "^([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳专]{1})*$"
    
    /// 新能源车牌号
    case RegexNewEnergyHphm = "^([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{5}[A-Z0-9挂学警港澳专]{1})*$"
    
    /// 统一社会信用代码
    case RegexUnifiedSocialCreditCode = "[1-9A-GY]{1}[1239]{1}[1-5]{1}[0-9]{5}[0-9A-Z]{10}"

}
