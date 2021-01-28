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
        print(viewModel.details)
    }
    
    var body: some View {
        
        List {
            AddressView(address: viewModel.details.address)
            OpenHoursView(openHours: viewModel.details.openHours)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(id: 1)
    }
}
