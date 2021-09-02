//
//  CocktailListItem.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import Foundation
import UIKit

struct CocktailListItem {
    
    let cocktail: Cocktail
    
    var name: String {
        cocktail.name
    }
    
    var shortDescription: String{
        cocktail.shortDescription
    }
    
    var longDescription: String{
        cocktail.longDescription
    }
    
    var preparationTime: String{
        "\(cocktail.preparationMinutes) Minutes"
    }
    
    var image: UIImage?{
        UIImage(named: cocktail.imageName)
    }
    
    var ingredientsCount: Int {
        cocktail.ingredients.count
    }
    
    func ingredient(index: Int) -> String? {
        guard index < ingredientsCount else { return nil }
        return cocktail.ingredients[index]
    }
}

extension CocktailListItem : CocktailPresentable{}
