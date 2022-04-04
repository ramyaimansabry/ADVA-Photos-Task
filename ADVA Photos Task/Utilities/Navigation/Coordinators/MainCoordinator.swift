//
//  MainCoordinator.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 30/03/2022.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(HomeViewController(), animated: false)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
        childCoordinators.removeLast()
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true, completion: nil)
        childCoordinators.removeLast()
    }
    
    func presentDetailsScreen() {
//        navigationController.present(PhotoDetailsViewViewController(), animated: true, completion: nil)
    }
}
