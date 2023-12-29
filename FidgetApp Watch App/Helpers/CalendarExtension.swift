//
//  CalendarExtension.swift
//  PayCheckCalc
//
//  Created by Jose Blanco on 5/11/23.
//

import Foundation

extension Calendar {
    private var currentDate: Date { return Date() }
    
    func isDateInThisWeek(_ date: Date) -> Bool {
        return isDate(date, equalTo: currentDate, toGranularity: .weekOfYear)
    }
    
    func isDateInThisMonth(_ date: Date) -> Bool {
        return isDate(date, equalTo: currentDate, toGranularity: .month)
    }
    
    func isDateInThisYear(_ date: Date) -> Bool {
        return isDate(date, equalTo: currentDate, toGranularity: .year)
    }
    
    func isDateInNextWeek(_ date: Date) -> Bool {
        guard let nextWeek = self.date(byAdding: DateComponents(weekOfYear: 1), to: currentDate) else {
            return false
        }
        return isDate(date, equalTo: nextWeek, toGranularity: .weekOfYear)
    }
    
    func isDateInNextMonth(_ date: Date) -> Bool {
        guard let nextMonth = self.date(byAdding: DateComponents(month: 1), to: currentDate) else {
            return false
        }
        return isDate(date, equalTo: nextMonth, toGranularity: .month)
    }
    
    func isDateInFollowingMonth(_ date: Date) -> Bool {
        guard let followingMonth = self.date(byAdding: DateComponents(month: 2), to: currentDate) else {
            return false
        }
        return isDate(date, equalTo: followingMonth, toGranularity: .month)
    }
}

extension Date {
    var startOfWeek: String? {
        let formatter1 = DateFormatter()
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        let date = gregorian.date(byAdding: .day, value: 1, to: sunday) ?? Date()
        formatter1.dateFormat = "MMMM d"
        return formatter1.string(from: date)
    }
    
    var endOfWeek: String? {
        let formatter1 = DateFormatter()
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        let date = gregorian.date(byAdding: .day, value: 7, to: sunday) ?? Date()
        formatter1.dateFormat = "MMMM d"
        return formatter1.string(from: date)
    }
    
    var getMonth: String? {
        let formatter1 = DateFormatter()
        let date = Date()
        formatter1.dateFormat = "MMMM yyyy"
        return formatter1.string(from: date)
    }
    
    var getYear: String? {
        let formatter1 = DateFormatter()
        let date = Date()
        formatter1.dateFormat = "yyyy"
        return formatter1.string(from: date)
    }
    
    var getMinDate: String? {
        let formatter1 = DateFormatter()
        let minPaycheck = DataBaseManager.shared.payChecks.min(by: { $0.date < $1.date})
        formatter1.dateFormat = "yyyy"
        return formatter1.string(from: minPaycheck?.date ?? Date())
    }
    
    var getMaxDate: String? {
        let formatter1 = DateFormatter()
        let maxPaycheck = DataBaseManager.shared.payChecks.max(by: {$0.date > $1.date})
        formatter1.dateFormat = "MMMM yyyy"
        return formatter1.string(from: maxPaycheck?.date ?? Date())
    }
    
}

//func formattedDate(date: Date) -> String {
//
//
//    if  Calendar.current.isDateInToday(date) {
//        return NSLocalizedString("Today", value: "Today", comment: "")
//    } else if Calendar.current.isDateInYesterday(date){
//        return NSLocalizedString("Yesterday", value: "Yesterday", comment: "")
//    } else if Calendar.current.isDateInThisWeek(date) {
//        formatter1.dateFormat = "EEEE"
//        return  formatter1.string(from: date)
//    } else {
//        formatter1.dateFormat = "EE MM-dd-yyyy"
//        return  formatter1.string(from: date)
//    }
//}
