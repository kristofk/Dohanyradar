//
//  BaseProjectAPIRequest.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

enum BaseProjectAPIRequest {
    case shops
    case shopDetails(id: Int)
    case shopImage(id: Int)
    
    var path: String {
        switch self {
        case .shops:
            return "/tobbacoshop"
        case .shopDetails(let id):
            return "/tobbacoshop/\(id)"
        case .shopImage(let id):
            return "/tobbacoshop/\(id)/image"
        }
    }
}
