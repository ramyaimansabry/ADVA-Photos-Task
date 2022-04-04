//
//  HomeCoordinator.swift
//  ADVA Photos Task
//
//  Created by Ramy Sabry on 04/04/2022.
//

import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        viewController.coordinator = self
        navigationController.setViewControllers([viewController], animated: false)
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func presentDetailsScreen(using photoData: PhotoData) {
        let viewController = PhotoDetailsViewViewController(photoData: photoData)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
