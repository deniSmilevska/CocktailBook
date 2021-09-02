//
//  Cocktail.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import Foundation

struct Cocktail: Decodable {
    
    var id: String
    var name: String
    var type: CocktailType
    var shortDescription: String
    var longDescription: String
    var preparationMinutes: Int
    var imageName: String
    var ingredients: [String]
    var isFavorite: Bool = false
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case shortDescription
        case longDescription
        case preparationMinutes
        case imageName
        case ingredients
    }
}
