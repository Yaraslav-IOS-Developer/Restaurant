//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Yaroslav on 26.01.21.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    

    var menuItem: MenuItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        updateUI()
    }
    
    func setupUI() {
        
        addToOrderButton.layer.cornerRadius = 5
        
    }
    
    func updateUI() {
        title = menuItem.name
        nameLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        detailLabel.text = menuItem.detailText
    }
    

    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.addToOrderButton.transform = CGAffineTransform.identity
        }
        
    }
    

}
