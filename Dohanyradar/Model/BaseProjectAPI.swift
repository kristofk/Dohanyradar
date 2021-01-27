//
//  BaseProjectAPI.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import Foundation
import Combine

enum BaseProjectAPI {
    static let apiClient = APIClient()
    static let baseURL = URL(string: "https://dohanyradar.codevisionkft.hu")!
    
    static func getShops() -> AnyPublisher<[TobaccoShopListModel], Error> {
        return request(BaseProjectAPIRequest.shops.path)
    }
    
    static func getShopDetails(id: Int) -> AnyPublisher<TobaccoShopModel, Error> {
        return request(BaseProjectAPIRequest.shopDetails(id: id).path)
    }
    
    private static func request<T: Decodable>(_ path: String) -> AnyPublisher<T, Error> {
        guard let componenets = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true) else {
            fatalError("Bad URL")
        }
        let request = URLRequest(url: componenets.url!)
        
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
}
