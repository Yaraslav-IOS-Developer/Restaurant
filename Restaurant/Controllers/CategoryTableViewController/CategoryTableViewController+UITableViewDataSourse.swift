//
//  CategoryTableViewController+UITableViewDataSourse.swift
//  Restaurant
//
//  Created by Yaroslav on 27.01.21.
//
import UIKit

extension CategoryTableViewController/*:UITableViewDataSourse*/ {
    
    //MARK: - UITableViewDataSourse
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")!
        configure(cell, forItemAt: indexPath)
        return cell
    }
    
    //MARK:  - Cell configuration
    
    func configure(_ cell: UITableViewCell, forItemAt indexPatch: IndexPath) {
        let category = categoryes[indexPatch.row]
        cell.textLabel?.text = category.capitalized
        
    }
}
