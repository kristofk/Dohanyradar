//
//  ContentView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            NavigationView {
                ListView()
            }
                .tabItem {
                    Image(systemName: "rectangle.grid.1x2.fill")
                    Text("Boltok")
                }
            MapView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Térkép")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
