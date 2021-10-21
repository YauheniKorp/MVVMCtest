//
//  LoginViewController.swift
//  MVVM+C
//
//  Created by Admin on 18.10.2021.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginViewController: BaseViewController {

    let loginField: UITextField
    let passwordField: UITextField
    let loginButton: UIButton
    let appLabel: UILabel
    let contentLayoutGuide: UILayoutGuide
    
    private let disposeBag = DisposeBag()

    override init() {
        self.loginField = UITextField()
        self.passwordField = UITextField()
        self.loginButton = UIButton(type: .system)
        self.appLabel = UILabel()
        self.contentLayoutGuide = UILayoutGuide()
        
        super.init()
    }
    override func loadView() {
        super.loadView()
        
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(appLabel)
        
        [loginField, passwordField, loginButton, appLabel].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        view.addLayoutGuide(contentLayoutGuide)
        
        NSLayoutConstraint.activate([
            loginField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            appLabel.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            loginField.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 16.0),
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 16.0),
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16.0),
            loginButton.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            
            loginField.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            loginField.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            
            loginField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            appLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        
            contentLayoutGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        loginField.layer.borderWidth = 1.0
        loginField.layer.cornerRadius = 5
        loginField.placeholder = "Email"
        loginField.borderStyle = .roundedRect
        loginField.textContentType = .emailAddress
        loginField.keyboardType = .emailAddress
        loginField.autocorrectionType = .no
        loginField.autocapitalizationType = .none
        
        passwordField.layer.borderWidth = 1.0
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.layer.cornerRadius = 5
        passwordField.borderStyle = .roundedRect
        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.backgroundColor = .systemPink
        loginButton.layer.cornerRadius = 7
        
        appLabel.text = "My App"
        appLabel.textAlignment = .center
        appLabel.font = UIFont.systemFont(ofSize: 32)
        
        
        
    }
    
    func bind(viewModel: LoginViewModel) {
        viewModel.loginFieldText
            .drive(loginField.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.passwordFieldText
            .drive(passwordField.rx.text)
            .disposed(by: disposeBag)
        
        
    }
}


