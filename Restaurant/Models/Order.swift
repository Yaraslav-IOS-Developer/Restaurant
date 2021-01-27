//
//  Order.swift
//  Restaurant
//
//  Created by Yaroslav on 26.01.21.
//

import Foundation



struct Order: Codable {
    var menuItem: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItem = menuItems
    }
}
