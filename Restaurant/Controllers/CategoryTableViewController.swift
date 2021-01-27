//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Yaroslav on 26.01.21.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManagerMenuController.shared.fetchCategories { categories in
            print(#function, categories ?? "nil")
        }
        
        NetworkManagerMenuController.shared.fetchMenuItens(forCategory: "soups") { menuItems in
            print(#function, menuItems ?? "nil")
            menuItems?.forEach { print("\t\($0)")}
                print()
            
        }
    }
    

}
