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
            .navigationTitle("")
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
