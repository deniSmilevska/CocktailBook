//
//  Coordinator.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var rootViewController: UINavigationController? { get }
    
    func start()
}

// MARK: - Extension Coordinator
extension Coordinator {
    
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
    
    func removeAllChildCoordinatorsWith<T>(type: T.Type) {
        childCoordinators = childCoordinators.filter { $0 is T  == false }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators.removeAll()
    }
}
