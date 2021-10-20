//
//  SessionRepository.swift
//  MVVM+C
//
//  Created by Admin on 19.10.2021.
//

import Foundation
import RxSwift
import RxCocoa

class SessionRepository {
    
    static let shared = SessionRepository()
    
    private init() {
        
    }
    
    private var state: UserState = .notLoggedIn
    
    func logInUser(login: String, password: String) -> Single<Bool> {
        state = .loggedIn(UserSession(login: login, password: password))
        return .just(true).delay(.seconds(1), scheduler: MainScheduler.asyncInstance)
    }
}


