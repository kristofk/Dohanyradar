//
//  AddressView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import SwiftUI
import MapKit

struct AddressView: View {
    
    let address: String
    
    var body: some View {
        HStack {
            Text("Cím")
            Text(address)
                .frame(maxWidth: .infinity, minHeight: 100 ,alignment: .trailing)
                .multilineTextAlignment(.trailing)
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(address: "Wess u. 3")
    }
}
