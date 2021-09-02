//
//  MainScreenCoordinatorProtocol.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import Foundation

protocol MainVCCoordinatorProtocol: AnyObject {
    func cocktailSelected(cocktailItem: CocktailListItem)
}
