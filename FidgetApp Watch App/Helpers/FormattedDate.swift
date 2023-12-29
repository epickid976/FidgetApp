//
//  DateFormatFunction.swift
//  FidgetApp Watch App
//
//  Created by Jose Blanco on 6/30/23.
//

import Foundation

func formattedDate(date: Date) -> String {
    let formatter1 = DateFormatter()
    
    if  Calendar.current.isDateInToday(date) {
        return NSLocalizedString("Today", value: "Today", comment: "")
    } else if Calendar.current.isDateInYesterday(date){
        return NSLocalizedString("Yesterday", value: "Yesterday", comment: "")
    } else if Calendar.current.isDateInThisWeek(date) {
        formatter1.dateFormat = "EEEE"
        return  formatter1.string(from: date)
    } else {
        formatter1.dateFormat = "EE MM-dd-yyyy"
        return  formatter1.string(from: date)
    }
}
