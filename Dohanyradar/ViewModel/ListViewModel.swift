//
//  ListViewModel.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import Foundation
import Combine

class ListViewModel: ObservableObject {
    
    @Published var shops: [TobaccoShopListModel] = []
    var cancellationToken: AnyCancellable?
    
    init() {
        getShops()
    }
    
    func getShops() {
        cancellationToken = BaseProjectAPI.getShops()
            .mapError({ (error) -> Error in
                print("Error: \(error)")
                return error
            })
            .sink(receiveCompletion: { (_) in }, receiveValue: { self.shops = $0 })
    }
}
