//
//  MainCoordinator.swift
//  CocktailBook
//
//  Created by Deni Smilevska on 1.9.21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator{
   
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UINavigationController? {
        navigationController
    }
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func start() {
        let vc = MainScreenViewController.instantiate()
        vc.coordinatorDelegate = self
        rootViewController?.pushViewController(vc, animated: false)
    }
}

extension MainCoordinator: MainVCCoordinatorProtocol{
    func cocktailSelected(cocktailItem: CocktailListItem) {
        let vc = DetailsViewController.instantiate()
        vc.cocktailItem = cocktailItem
        rootViewController?.pushViewController(vc, animated: true)
    }
}
