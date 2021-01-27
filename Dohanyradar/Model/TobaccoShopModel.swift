//
//  TobaccoShopModel.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import Foundation

struct TobaccoShopModel: Codable {
    let id: Int
    let name: String
    let address: String
    let description: String
    let isOpen: Bool
    let openHours: [OpenHourModel]
}
