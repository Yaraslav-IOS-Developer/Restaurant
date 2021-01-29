//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Yaroslav on 26.01.21.
//

import UIKit

class MenuItemDetailViewController: UIViewController {

    var menuItem: MenuItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = menuItem.name
        print(#function, menuItem)
        
    }
    

    

}
