//
//  BaseViewController.swift
//  MVVM+C
//
//  Created by Admin on 19.10.2021.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
   
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }
}
