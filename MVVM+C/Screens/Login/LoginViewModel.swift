//
//  LoginViewModel.swift
//  MVVM+C
//
//  Created by Admin on 18.10.2021.
//

import Foundation
import RxRelay

class LoginViewModel {
    
    private let _loginTapped = PublishRelay<Void>()
    func loginTapped() {
        _loginTapped.accept(())
    }
    
    private let _loginFieldChanged = PublishRelay<String>()
    func loginFieldChanged(_ text:String) {
        _loginFieldChanged.accept(text)
    }
    
    private let _passwordFieldChanged = PublishRelay<String>()
    func passwordFieldChanged(_ text: String) {
        _passwordFieldChanged.accept(text)
    }
    
    lazy var loginFieldText = _loginFieldChanged.asDriver(onErrorJustReturn: "").startWith("")
    
    lazy var passwordFieldText = _passwordFieldChanged.asDriver(onErrorJustReturn: "").startWith("")
    
    init() {
        
    }
}

