//
//  ListView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var shops: Shops
    
    var body: some View {
        NavigationView {
            List(shops.shops) { shop in
                NavigationLink(
                    destination: DetailView(id: shop.id),
                    label: {
                        Text(shop.name)
                    })
            }
            .navigationBarTitle("Boltok")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
