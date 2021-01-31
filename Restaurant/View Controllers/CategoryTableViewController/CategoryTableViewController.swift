//
//  CategoryTableViewController.swift
//  Restaurant
//
//  Created by Yaroslav on 26.01.21.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    var categoryes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManagerMenuController.shared.fetchCategories { categoryes in
            guard let categoryes = categoryes else { return }
            
            self.updateUI(with: categoryes)
        }
    }
    
    func updateUI(with categoryes: [String]) {
        DispatchQueue.main.async {
            self.categoryes = categoryes
            self.tableView.reloadData()
        }
    }
    

}
