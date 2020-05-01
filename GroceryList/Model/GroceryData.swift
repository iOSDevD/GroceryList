//
//  GroceryData.swift
//  GroceryList
//
//  Created by iOSDev on 4/26/20.
//  Copyright © 2020 iOSDev. All rights reserved.
//

import Foundation

struct GroceryData: Decodable  {
    var showFavorites:Bool = false
    var sections:[GrocerySection]
    
}

class DataFetcher {
    static func getData()->GroceryData{
        if let path = Bundle.main.path(forResource: "data", ofType: "plist")   {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return try PropertyListDecoder().decode(GroceryData.self, from: data)
            } catch {
                print("Data fetch error = \(error)")
            }
        
        }
        return GroceryData(showFavorites: false, sections: [])
    }
}

struct GrocerySection:Identifiable,Hashable,Decodable {
    var id:Int
    var sectionName:String
    var items:[Grocery] 
}



struct Grocery: Identifiable,Hashable, Decodable {
    var id:Int
    var name:String
    var isFavorite:Bool
    var price:Double
}
