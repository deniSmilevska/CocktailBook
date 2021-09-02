//
//  CocktailTableViewCell.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(cocktailPresentable: CocktailPresentable){
        
        nameLabel.text = cocktailPresentable.name
        shortDescriptionLabel.text = cocktailPresentable.shortDescription
    }
    
}
