//
//  ImageView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/28/21.
//

import SwiftUI

struct ImageView: View {
    
    let shopId: Int
    var imageUrl: String
    
    init(shopId: Int) {
        self.shopId = shopId
        self.imageUrl = "https://dohanyradar.codevisionkft.hu\(BaseProjectAPIRequest.shopImage(id: shopId).path)"
    }
    
    var body: some View {
        HStack {
            Spacer()
            RemoteImage(url: imageUrl)
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 400, alignment: .center)
            Spacer()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(shopId: 1)
    }
}
