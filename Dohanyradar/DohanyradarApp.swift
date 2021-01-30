//
//  DohanyradarApp.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import SwiftUI

@main
struct DohanyradarApp: App {
    
    let shops = Shops()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(shops)
        }
    }
}
