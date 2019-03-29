//
//  MyDate.swift
//  QYDate
//
//  Created by Qian Yiyu on 2019/3/29.
//  Copyright © 2019 Qian Yiyu. All rights reserved.
//

import Foundation

class MyDate: NSObject {
    
    private static var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Oct", "Sep", "Nov", "Dec"]
    
    //Return the current time in String
    class func getLocalTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }
    
    //Date to String
    class func date2String(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }
    
    //Return the today midnight in String
    class func getLocalTimeToDay() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd 00:00:00"
        return formatter.string(from: date)
    }
    
    //Return the current day in String
    class func getLocalDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    //String to Date
    class func dateFromStr(date: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.date(from: date)!
    }
    
    //Return n days ago
    class func getLocalTimeBefore(day: Int) -> String {
        var date = Date()
        date.addTimeInterval(TimeInterval(-day * 3600 * 24))
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }
    
    //Calculate the difference between two date (date2 > date1)
    class func intervalBetween(date1: String, date2: String) -> Int {
        //舍去时分秒
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var date1_D = formatter.date(from: date1)
        var date2_D = formatter.date(from: date2)
        formatter.dateFormat = "yyyy-MM-dd"
        let date1_S = formatter.string(from: date1_D!)
        let date2_S = formatter.string(from: date2_D!)
        date1_D = formatter.date(from: date1_S)
        date2_D = formatter.date(from: date2_S)
        //计算c相差天数
        let interval = date2_D!.timeIntervalSince(date1_D!)
        return Int(interval / Double(86400))
    }
    
    //Return the year with specified date
    class func getLocalYearWith(date: String) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date_D = formatter.date(from: date)
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date_D!)
        return (year as NSString).integerValue
    }
    
    //Return the month with specified date
    class func getLocalMonthWith(date: String) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date_D = formatter.date(from: date)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: date_D!)
        return (month as NSString).integerValue
    }
    
    //Return the day with specified date
    class func getLocalDayWith(date: String) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date_D = formatter.date(from: date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date_D!)
        return (day as NSString).integerValue
    }
    
    //Convert the date format to “Sep 28” type with specified date
    class func getLocalMonthAndDay(date: String) -> String {
        let Month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let month = getLocalMonthWith(date: date)
        let day = getLocalDayWith(date: date)
        return "\(Month[month - 1]) \(day)"
    }
    
    //Return the hours and mintues with specified date
    class func getLocalHourMinute(date: String) -> String {
        let r_date = dateFromStr(date: date)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: r_date)
    }
    
    //Return the hours with specified date
    class func getLocalHour(date: String ) -> Int {
        let r_date = dateFromStr(date: date)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let hour_str = formatter.string(from: r_date)
        let hour = NSString(string: hour_str).integerValue
        return hour
    }
    
    //Calculate the difference between two date
    class func secondsBetween(date1: String, date2: String) -> Float {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date1_r = formatter.date(from: date1)
        let date2_r = formatter.date(from: date2)
        let interval = date2_r?.timeIntervalSince(date1_r!)
        return Float(interval!)
    }
    
    //Calculate the number of days in a given year and month
    class func daysInYearAndMonth(year: String, month: String) -> Int {
        let date_str = year + "-" + month + "-01"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: date_str)
        let calendar = Calendar.current
        let range = calendar.range(of: Calendar.Component.day, in: Calendar.Component.month, for: date!)
        let length = range?.count
        return length!
    }
    
    //Calculate what day is the first day in a given year and month
    class func whatDayInYearAndMonth(year: String, month: String) -> Int {
        var calendar = Calendar.current
        let timeZone = TimeZone.current
        calendar.timeZone = timeZone
        let date_str = year + "-" + month + "-01"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: date_str)
        let calendarUnit = Calendar.Component.weekday
        let components = calendar.component(calendarUnit, from: date!)
        return components - 1
    }
    
    //Calculate what day is the specified date
    class func whatDayIn(date: String) -> Int {
        var calendar = Calendar.current
        let timeZone = TimeZone.current
        calendar.timeZone = timeZone
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date_t = formatter.date(from: date)
        let calendarUnit = Calendar.Component.weekday
        let components = calendar.component(calendarUnit, from: date_t!)
        return components - 1
    }
    
    //month to monthString
    class func monthStrWith(month: Int) -> String {
        return months[month - 1]
    }
    
    //Whether it's a leap year
    class func isLeapYear(year: Int) -> Bool {
        if (year % 400 == 0) {
            return true
        }
        if (year % 100 == 0) {
            return false
        }
        if (year % 4 == 0) {
            return true
        }
        return false
    }
}
