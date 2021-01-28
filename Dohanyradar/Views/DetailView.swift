//
//  DetailView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import SwiftUI

struct DetailView: View {
    
    let shopId: Int
    @ObservedObject var viewModel: DetailViewModel
    
    init(id: Int) {
        self.shopId = id
        self.viewModel = DetailViewModel(shopId: id)
    }
    
    var body: some View {
        VStack {
            AddressView(address: viewModel.details.address)
            Text("Nyitvatartás")
            Text(viewModel.details.openHours[0].openTime)
            Text(viewModel.details.openHours[0].prettyOpenTime ?? "XXX")
            Spacer()
        }
        .navigationBarTitle(viewModel.details.name)
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: 1)
    }
}
