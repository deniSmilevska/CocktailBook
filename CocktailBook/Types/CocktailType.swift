//
//  CocktailType.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import Foundation

enum CocktailType: String {
    
    case alcoholic
    case nonAlcoholic = "non-alcoholic"
    case unknown
}

extension CocktailType: Codable {
    init(from decoder: Decoder) throws {
        self = try CocktailType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}


