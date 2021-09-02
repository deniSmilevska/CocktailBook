//
//  IngredientView.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 2.9.21.
//

import UIKit

class IngredientView: UIView {

   //MARK: Outlets
    @IBOutlet weak var textLabel: UILabel!

    //MARK: Public methods
    func setupView(text: String){
        textLabel.text = text
    }
}
