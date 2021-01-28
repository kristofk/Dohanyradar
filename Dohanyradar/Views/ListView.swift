//
//  ListView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.shops) { shop in
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
