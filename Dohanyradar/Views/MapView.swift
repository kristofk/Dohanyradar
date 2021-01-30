//
//  MapView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/28/21.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    
    @EnvironmentObject var shops: Shops
    
    @State var coordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 47.497913, longitude: 19.040236),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @State private var cities: [City] = [
        City(coordinate: .init(latitude: 40.7128, longitude: 74.0060)),
        City(coordinate: .init(latitude: 37.7749, longitude: 122.4194)),
        City(coordinate: .init(latitude: 47.6062, longitude: 122.3321))
    ]
    
    var body: some View {
        NavigationView() {
            Map(coordinateRegion: $coordinateRegion, annotationItems: shops.shops) { shop in
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
            .navigationTitle("Térkép")
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
