//
//  ContentView.swift
//  GroceryList
//
//  Created by iOSDev on 4/26/20.
//  Copyright © 2020 iOSDev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var data:GroceryData
    let path = \GrocerySection.items

    var body: some View {
        NavigationView{
            List {
                Toggle(isOn: $data.showFavorites) {
                    Text("Show Favorites only")
                }
                ForEach(data.sections, id: \.self) { (item) in
                    Section(header: Text(item.sectionName)) {
                        ForEach(item.items) { (sectionItem) in
                            if !self.data.showFavorites || sectionItem.isFavorite {
                                GroceryRow(grocery: sectionItem)
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Grocery List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject( DataFetcher.getData())
    }
}
