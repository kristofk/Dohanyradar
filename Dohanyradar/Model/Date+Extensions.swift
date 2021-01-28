//
//  Date+Extensions.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import Foundation

extension Date {
    
    init?(fromISOString dateString: String) {
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: dateString) else {
            return nil
        }
        self = date
    }
    
    func hmString() -> String? {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = .current
        formatter.timeStyle = .short
        guard let adjustedDate = Calendar.current.date(byAdding: .minute, value: -16, to: self) else {
            return nil
        }
        return formatter.string(from: adjustedDate)
    }
    
    func indexOfTodayInWeek() -> Int? {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = .current
        formatter.dateFormat = "F"
        
        let date = Date()
        let dayIndexString = formatter.string(from: date)
        guard let dayIndex = Int(dayIndexString) else { return nil }
        return dayIndex - 1
    }
    
    func dayNameForIndexInWeek() -> String? {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = .current
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
    
    static func dayNameForIndexInWeek(_ index: Int) -> String? {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.timeZone = .current
        formatter.dateFormat = "F"
        guard let date = formatter.date(from: "\(index)") else { return nil }
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
    
}
