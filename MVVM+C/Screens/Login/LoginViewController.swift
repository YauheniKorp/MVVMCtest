//
//  LoginViewController.swift
//  MVVM+C
//
//  Created by Admin on 18.10.2021.
//

import UIKit

final class LoginViewController: BaseViewController {

    let loginField: UITextField
    let passwordField: UITextField
    let loginButton: UIButton
    let contentLayoutGuide: UILayoutGuide

    override init() {
        self.loginField = UITextField()
        self.passwordField = UITextField()
        self.loginButton = UIButton(type: .system)
        self.contentLayoutGuide = UILayoutGuide()
        
        super.init()
    }
    override func loadView() {
        super.loadView()
        
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        
        [loginField, passwordField, loginButton].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        view.addLayoutGuide(contentLayoutGuide)
        
        NSLayoutConstraint.activate([
            loginField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginField.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 16.0),
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16.0),
            loginButton.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            
            loginField.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            loginField.trailingAnchor.constraint(equalTo: passwordField.trailingAnchor),
            
            loginField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            loginButton.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor),
        
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
    }
}
