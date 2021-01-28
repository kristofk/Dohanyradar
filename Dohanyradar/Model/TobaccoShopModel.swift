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
}
