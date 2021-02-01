//
//  OrderTableViewController+UITableViewDataSorce.swift
//  Restaurant
//
//  Created by Yaroslav on 1.02.21.
//

import UIKit

extension OrderTableViewController /*:UITableViewDataSorce*/ {
    
    //MARK: - UITableViewDataSourse
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkManagerMenuController.shared.order.menuItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell")!
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    //MARK:  - Cell configuration
    
    func configure(_ cell: UITableViewCell, forItemAt indexPatch: IndexPath) {
        let menuItem = NetworkManagerMenuController.shared.order.menuItem[indexPatch.row]
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
        
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "MenuDetailSegue" else { return }
        
        let controller = segue.destination as! MenuItemDetailViewController
        let index = tableView.indexPathForSelectedRow!.row
        let menuItem = NetworkManagerMenuController.shared.order.menuItem[index]
        controller.menuItem = menuItem
        
    }
}
