//
//  UIView+Extension.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 2.9.21.
//

import Foundation
import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
