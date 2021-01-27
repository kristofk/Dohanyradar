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
        List(viewModel.shops) { shop in
            Text(shop.name)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
