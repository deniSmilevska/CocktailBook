//
//  CocktailType.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import Foundation

enum CocktailType: String, CaseIterable {
    case alcoholic
    case nonAlcoholic = "non-alcoholic"
    case unknown
    
    init?(title: String) {
        for value in CocktailType.allCases where "\(value.title)" == title {
            self = value
            return
        }
        return nil
    }
    
    var title : String {
        switch self {
        case .alcoholic: return "Alcoholic"
        case .nonAlcoholic: return "Non-Alcoholic"
        case .unknown: return "All"
        }
    }
    
    var navTitle: String {
        return "\(title) Cocktails"
    }
}

extension CocktailType: Codable {
    init(from decoder: Decoder) throws {
        //default type is alcoholic
        self = try CocktailType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}


