//
//  ContentView.swift
//  GroceryList
//
//  Created by iOSDev on 4/26/20.
//  Copyright © 2020 iOSDev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var data:GroceryData
    let path = \GrocerySection.items

    

    var body: some View {
        NavigationView{
            List {
                
                ForEach(data.sections, id: \.self) { (item) in
                    Section(header: Text(item.sectionName)) {
                        ForEach(item.items) { (sectionItem) in
                            Text(sectionItem.name)
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
        ContentView(data: DataFetcher.getData())
    }
}
