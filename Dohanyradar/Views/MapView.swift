//
//  MapView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/28/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject var shops: Shops
    
    var body: some View {
        NavigationView() {
            ShopMapView(shops: shops.shops)
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
