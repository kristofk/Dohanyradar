//
//  ShopMapView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/30/21.
//

import SwiftUI
import MapKit

struct ShopMapView: View {
    
    let shops: [TobaccoShopListModel]
    
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 47.497913, longitude: 19.040236),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    var body: some View {
        Map(coordinateRegion: $coordinateRegion, annotationItems: shops) { shop in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: shop.latitude, longitude: shop.longitude)) {
                NavigationLink(destination: DetailView(id: shop.id)) {
                    ZStack {
                        Image(systemName: "mappin")
                        Text(shop.name).offset(x: 0, y: 15)
                    }
                    .padding(.vertical, 15)
                }
            }
        }
    }
}

//struct ShopMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopMapView()
//    }
//}
