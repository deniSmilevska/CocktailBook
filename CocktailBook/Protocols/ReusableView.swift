//
//  ReusableView.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import Foundation

import UIKit

protocol ReusableView {

    static var reuseIdentifier: String { get }

}

extension ReusableView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }

}

extension UITableViewCell: ReusableView {}
