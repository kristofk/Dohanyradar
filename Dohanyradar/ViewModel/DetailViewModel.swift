//
//  DetailViewModel.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    let shopId: Int
    @Published var details: TobaccoShopModel
    var cancellationToken: AnyCancellable?
    
    init(shopId: Int) {
        self.shopId = shopId
        self.details = TobaccoShopModel.empty(id: shopId)
        getDetails()
    }
    
    func getDetails() {
        cancellationToken = BaseProjectAPI.getShopDetails(id: shopId)
            .mapError({ (error) -> Error in
                print("Error: \(error)")
                return error
            })
            .sink(receiveCompletion: { (_) in }, receiveValue: { self.details = $0 })
    }
}
