//
//  CoordinatorType.swift
//  MVVM+C
//
//  Created by Admin on 18.10.2021.
//

import UIKit

protocol CoordinatorType {
    func start() -> UIViewController
    var navigationController: UINavigationController {get}
}

extension CoordinatorType {
    var sceneDelegate: SceneDelegate? {
        return navigationController.view.window?.windowScene?.delegate as? SceneDelegate
    }
    
    func coordinate(to coordinator: CoordinatorType) {
        sceneDelegate?.rootCoordinator = coordinator
    }
}
