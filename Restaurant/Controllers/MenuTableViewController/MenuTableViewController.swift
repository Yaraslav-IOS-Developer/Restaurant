//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Yaroslav on 26.01.21.
//

import UIKit


class MenuTableViewController: UITableViewController {
    
    var category: String!
    var menuItems = [MenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.capitalized
        
        NetworkManagerMenuController.shared.fetchMenuItens(forCategory: category) { menuItems in
            guard let menuItems = menuItems else { return }
            
            self.updateUI(with: menuItems)
        }
    }
    
    func updateUI(with menuItems: [MenuItem]) {
        DispatchQueue.main.async {
            self.menuItems = menuItems
            self.tableView.reloadData()
        }
    }
}
