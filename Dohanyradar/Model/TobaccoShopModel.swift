//
//  TobaccoShopModel.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import Foundation

struct TobaccoShopModel: Codable, Identifiable {
    let id: Int
    let name: String
    let address: String
    let description: String
    let isOpen: Bool
    let openHours: [OpenHourModel]
    
    static func empty(id: Int) -> TobaccoShopModel {
        return TobaccoShopModel(id: id, name: "", address: "", description: "", isOpen: true, openHours: [])
    }
    
    func nextOpenDate(afterDayIndex day: Int, iteration: Int = 0) -> OpenHourModel? {
        if iteration == 8 { return nil } // No open hour, infinite loop
        let nextDayIndex = (day + 1) % 7
        guard let hours = openHours.first(where: { $0.day == nextDayIndex }) else {
            return nextOpenDate(afterDayIndex: nextDayIndex, iteration: iteration + 1)
        }
        return hours
    }
}
