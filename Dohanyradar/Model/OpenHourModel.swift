//
//  OpenHourModel.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import Foundation

struct OpenHourModel: Codable, Identifiable {
    let id = UUID()
    let day: Int
    let openTime: String
    let closeTime: String
    
    var prettyOpenTime: String? {
        return Date(fromISOString: openTime)?.hmString()
    }
    
    var prettyCloseTime: String? {
        return Date(fromISOString: closeTime)?.hmString()
    }
    
    var dayName: String? {
        switch day {
        case 0: return "Hétfő"
        case 1: return "Kedd"
        case 2: return "Szerda"
        case 3: return "Csütörtök"
        case 4: return "Péntek"
        case 5: return "Szombat"
        case 6: return "Vasárnap"
        default: return nil
        }
    }
    
}
