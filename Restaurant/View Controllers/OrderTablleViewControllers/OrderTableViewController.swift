//
//  OrderTableViewController.swift
//  Restaurant
//
//  Created by Yaroslav on 1.02.21.
//

import UIKit

class OrderTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            tableView,
            selector: #selector(UITableView.reloadData),
            name: NetworkManagerMenuController.orderUpdateNotification,
            object: nil)
    }
}
