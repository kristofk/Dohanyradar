//
//  TobaccoShopListModel.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import Foundation

struct TobaccoShopListModel: Codable, Identifiable {
    let id: Int
    let name: String
    let address: String
    let longitude: Double
    let latitude: Double
    let isOpen: Bool
}
