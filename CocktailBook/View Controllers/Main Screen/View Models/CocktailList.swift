//
//  CocktailList.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import Foundation

struct CocktailList {
    
    var cocktails: [Cocktail]
    
    var numberOfSections: Int{
        return 1
    }
    
    var cocktailCount: Int {
        return cocktails.count
    }
    
    func viewModel(for index: Int) -> CocktailListItem {
        return CocktailListItem(cocktail: cocktails[index])
    }

}
