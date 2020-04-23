//
//  NSDate+Extension.swift
//  ChildPediatric
//
//  Created by safiri on 2018/4/29.
//  Copyright © 2018年 safiri. All rights reserved.
//

import Foundation

public let DateFormatYMDString = "yyyy-MM-dd"
public let DateFormatYMDHMSString = "yyyy-MM-dd HH:mm:ss"
public let DateFormatYMDHMSString2 = "yyyyMMddHHmmss"
public let DateFormatYMDHMString = "yyyy-MM-dd HH:mm"
public let DateFormatYMDChineseString = "yyyy年MM月dd日"
public let DateFormatYMDHMChineseString = "yyyy年MM月dd日 HH:mm"

public extension Date {
    
    /// 指定格式的当前时间
    static func timeNowFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: Date());
    }
    
    /// 1970的时间戳转化为指定格式时间字符串 timeString为秒
    static func timeTransform(timeStampInterval stamp: Double, forFormatString format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let date = Date(timeIntervalSince1970: stamp)
        let dateString = formatter.string(from: date);
        return dateString;
    }
    
    /// 当前时间的1970时间戳毫秒
    static func timeStampNow() -> Double {
        return Date().timeIntervalSince1970 * 1000
    }
    
    
    /// 根据指定的日期字符串和格式，返回指定的日期格式的字符串
    /// - Parameters:
    ///   - giveDateString: 指定的日期字符串
    ///   - formatString: 指定的日期格式
    ///   - resultDateFormat: 返回值指定的日期格式
    /// - Returns: 日期
    static func timeTransition(fromGiveDate giveDateString: String?, formFormat formatString: String, resultFormat resultDateFormat: String) -> String {
        if giveDateString == nil {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateFormat = formatString
        formatter.locale = Locale.current
        
        var resultDateString = ""
        if let giveDate = formatter.date(from: giveDateString!) {
            formatter.dateFormat = resultDateFormat
            resultDateString = formatter.string(from: giveDate)
        }
        return resultDateString
    }
}

// MARK: 实例方法
public extension Date {
    /**
     Returns a date representing the receiver date shifted later by the provided number of days.
     
     @param days  Number of days to add.
     @return Date modified by the number of desired days.
     */
    func timeDateByAdding(_ days: Int) -> Date {
        let addTimeInterval = self.timeIntervalSinceReferenceDate + Double(86400 * days)
        let newDate = Date(timeIntervalSinceReferenceDate: addTimeInterval)
        return newDate
    }
    
    /**
    Returns a date representing the receiver date shifted later by the provided number of months.
    
    @param months  Number of months to add.
    @return Date modified by the number of desired months.
    */
    func timeDateByAddingMonths(_ months: Int) -> Date? {
        let calendar = Calendar.current
        var components = DateComponents()
        components.month = months
        return calendar.date(byAdding: components, to: self)
    }
    
    /**
     Returns a formatted string representing this date.
     see http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
     for format description.
     
     @param format   String representing the desired date format.
     e.g. @"yyyy-MM-dd HH:mm:ss"
     
     @return NSString representing the formatted date string.
     */
    func timeFormat(_ formatString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formatString
        formatter.locale = Locale.current
        return formatter.string(from: self)
    }
}
