//
//  ListView.swift
//  Dohanyradar
//
//  Created by Kristof Kocsis on 1/27/21.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var shops: Shops
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    
    var body: some View {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        TextField("search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)
                        
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)
                    
                    if showCancelButton  {
                        Button("Cancel") {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            self.searchText = ""
                            self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton)
                
                List(shops.shops.filter { searchText.isEmpty ? true : $0.name.contains(searchText)} ) { shop in
                    NavigationLink(
                        destination: DetailView(id: shop.id),
                        label: {
                            Text(shop.name)
                                .background(Color.clear)
                        })
                }
                .padding([.leading, .trailing], -20)
                
            }
            .navigationTitle("Boltok")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
