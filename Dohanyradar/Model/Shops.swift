//
//  Shops.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/28/21.
//

import Combine

class Shops: ObservableObject {
    
    @Published var shops: [TobaccoShopListModel] = []
    @Published var shopsDetails: [TobaccoShopModel] = []
    
    var cancellationToken: AnyCancellable?
    
    init() {
        loadShops()
    }
    
    func getDetails(for id: Int) -> TobaccoShopModel {
        if let details = shopsDetails.first(where: { $0.id == id }) {
            return details
        }
        loadDetails(for: id)
        return TobaccoShopModel.empty(id: id)
    }
    
    func loadShops() {
        cancellationToken = BaseProjectAPI.getShops()
            .mapError({ (error) -> Error in
                print("Error: \(error)")
                return error
            })
            .sink(receiveCompletion: { (_) in }, receiveValue: { self.shops = $0 })
    }
    
    func loadDetails(for id: Int) {
        cancellationToken = BaseProjectAPI.getShopDetails(id: id)
            .mapError({ (error) -> Error in
                print("Error: \(error)")
                return error
            })
            .sink(receiveCompletion: { (_) in }, receiveValue: { self.shopsDetails.append($0) })
    }
    
    
}
