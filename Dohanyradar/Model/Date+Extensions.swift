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
    
}
