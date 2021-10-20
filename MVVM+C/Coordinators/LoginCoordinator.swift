//
//  LoginCoordinator.swift
//  MVVM+C
//
//  Created by Admin on 18.10.2021.
//

import UIKit

class LoginCoordinator: CoordinatorType {
    let navigationController = UINavigationController(rootViewController: UIViewController())
    
    func start() -> UIViewController {
        navigationController.setViewControllers([showLoginScreen()], animated: true)
        return navigationController
    }

    func showLoginScreen() -> UIViewController {
        let viewController = LoginViewController()
        return viewController
    }
    
}
