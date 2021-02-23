//
//  Time.swift
//  ZhihuDaily
//
//  Created by 花逢坂詩織 on 2021/2/20.
//

import Foundation

func getHour() -> String {
    let date: Date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH"
    return dateFormatter.string(from: date)
}

func getDay() -> String {
    let date: Date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd"
    return dateFormatter.string(from: date)
}

func getMonth() -> String {
    let date: Date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM"
    return dateFormatter.string(from: date)
    
}

func getYear() -> String {
    let date: Date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy"
    return dateFormatter.string(from: date)
    
}

// MARK: 转换月份数字为汉字
func month_zh() -> String {
    let month: String = getMonth()
    switch month {
    case "01":
        return "一月"
    case "02":
        return "二月"
    case "03":
        return "三月"
    case "04":
        return "四月"
    case "05":
        return "五月"
    case "06":
        return "六月"
    case "07":
        return "七月"
    case "08":
        return "八月"
    case "09":
        return "九月"
    case "10":
        return "十月"
    case "11":
        return "十一月"
    case "12":
        return "十二月"
    default:
        return "month"
    }
}

// MARK: 转换为中文日期格式
func date_zh(date: String) -> String {
    let monthFirstIndex = date.index(date.startIndex, offsetBy: 4)
    let monthSecondIndex = date.index(date.startIndex, offsetBy: 5)
    let DayFirstIndex = date.index(date.startIndex, offsetBy: 6)
    let DaySecondIndex = date.index(date.startIndex, offsetBy: 7)
    
    if date[monthFirstIndex] == "0" {
        if date[DayFirstIndex] == "0" {
            return "\(date[monthSecondIndex])月\(date[DaySecondIndex])日"
        } else {
            return "\(date[monthSecondIndex])月\(date[DayFirstIndex])\(date[DaySecondIndex])日"
        }
    } else {
        if date[DayFirstIndex] == "0" {
            return "\(date[monthFirstIndex])\(date[monthSecondIndex])月\(date[DaySecondIndex])日"
        } else {
            return "\(date[monthFirstIndex])\(date[monthSecondIndex])月\(date[DayFirstIndex])\(date[DaySecondIndex])日"
        }
    }
}

// MARK: url中的日期格式
func dateCode() -> Int {
    return Int("\(getYear())\(getMonth())\(getDay())")!
}
