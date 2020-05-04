//
//  GroceryRow.swift
//  GroceryList
//
//  Created by iOSDev on 5/3/20.
//  Copyright © 2020 iOSDev. All rights reserved.
//

import SwiftUI

struct GroceryRow: View {
    let grocery:Grocery
    var body: some View {
        HStack {
            Text(grocery.name)
                .font(.title)
                .fontWeight(.regular)
            Spacer()
            Text(grocery.getFormatttedPrice())
                .fontWeight(.thin)
            Image(systemName: "star.fill").foregroundColor(grocery.isFavorite ? Color.yellow : Color.gray)
            
        }.padding()
    }
}

struct GroceryRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            GroceryRow(grocery: Grocery(id: 1, name: "Milk", isFavorite: true, price: 1.0)).previewLayout(.fixed(width: 300.0, height: 50.0))
            GroceryRow(grocery: Grocery(id: 1, name: "Egg", isFavorite: false, price: 0.12)).previewLayout(.fixed(width: 300.0, height: 50.0))
        }
    }
}
