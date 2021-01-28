//
//  OpenHourModel.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import Foundation

struct OpenHourModel: Codable {
    let day: Int
    let openTime: String
    let closeTime: String
    
    var prettyOpenTime: String? {
        return Date(fromISOString: openTime)?.hmString()
    }
    
    var prettyCloseTime: String? {
        return Date(fromISOString: openTime)?.hmString()
    }
    
}
