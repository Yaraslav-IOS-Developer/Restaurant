//
//  MenuTableViewController+UITableViewDataSource.swift
//  Restaurant
//
//  Created by Yaroslav on 28.01.21.
//

import UIKit

 
extension  MenuTableViewController/*:UITableViewDataSourse*/ {
    
    //MARK: - UITableViewDataSourse
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell")!
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    //MARK:  - Cell configuration
    
    func configure(_ cell: UITableViewCell, forItemAt indexPatch: IndexPath) {
        let menuItem = menuItems[indexPatch.row]
        cell.textLabel?.text = menuItem.name
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
        NetworkManagerMenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                if let currentIndexPath = self.tableView.indexPath(for: cell),
                   currentIndexPath != indexPatch {
                    return
                }
                cell.imageView?.image = image
                cell.setNeedsLayout()
                
            }
        }
        
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "MenuDetailSegue" else { return }
        
        let controller = segue.destination as! MenuItemDetailViewController
        let index = tableView.indexPathForSelectedRow!.row
        let menuItem = menuItems[index]
        controller.menuItem = menuItem
        
    }
    
    
    
}
