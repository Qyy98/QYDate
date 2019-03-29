//
//  ViewController.swift
//  QYDate
//
//  Created by Qian Yiyu on 2019/3/29.
//  Copyright © 2019 Qian Yiyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    var currentLabel = UILabel()
    var midnightLabel = UILabel()
    var dayLabel = UILabel()
    var beforeLabel = UILabel()
    var yearLabel = UILabel()
    var monthLabel = UILabel()
    var hmLabel = UILabel()
    var hourLabel = UILabel()
    var daysLabel = UILabel()
    var whatdayLabel = UILabel()
    var moreLabel = UILabel()
    var labels = [UILabel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitles()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    func setupTitles() {
        let currentTime: String = MyDate.getLocalTime()
        currentLabel.text = "Current Date: " + currentTime
        midnightLabel.text = "Current Midnight: " + MyDate.getLocalTimeToDay()
        dayLabel.text = "Current Day: " + MyDate.getLocalDate()
        beforeLabel.text = "3 days ago: " + MyDate.getLocalTimeBefore(day: 3)
        yearLabel.text = "Current Year: \(MyDate.getLocalYearWith(date: currentTime))"
        monthLabel.text = "Current Month: \(MyDate.getLocalMonthWith(date: currentTime))"
        hmLabel.text = "Current Hours and Mintues: " + MyDate.getLocalHourMinute(date: currentTime)
        hourLabel.text = "Current Hour: \(MyDate.getLocalHour(date: currentTime))"
        let num = MyDate.daysInYearAndMonth(year: "\(MyDate.getLocalYearWith(date: currentTime))", month: "\(MyDate.getLocalMonthWith(date: currentTime))")
        daysLabel.text = "This month has \(num) days"
        whatdayLabel.text = "Today is " + days[MyDate.whatDayIn(date: currentTime)]
        moreLabel.text = "More..."
    }
    
    func setupViews() {
        labels.append(currentLabel)
        labels.append(midnightLabel)
        labels.append(daysLabel)
        labels.append(beforeLabel)
        labels.append(yearLabel)
        labels.append(monthLabel)
        labels.append(hmLabel)
        labels.append(hourLabel)
        labels.append(daysLabel)
        labels.append(whatdayLabel)
        labels.append(moreLabel)
        var size: CGSize = .zero
        size = labels[0].sizeThatFits(CGSize.zero)
        labels[0].frame = CGRect(x: (self.view.frame.width - size.width) / 2, y: 100,
                                 width: size.width, height: size.height)
        self.view.addSubview(labels[0])
        for i in 1..<labels.count {
            size = labels[i].sizeThatFits(CGSize.zero)
            labels[i].frame = CGRect(x: (self.view.frame.width - size.width) / 2, y: labels[i-1].frame.maxY + 10,
                                     width: size.width, height: size.height)
            self.view.addSubview(labels[i])
        }
    }


}

