//
//  UserState.swift
//  MVVM+C
//
//  Created by Admin on 19.10.2021.
//

import Foundation

enum UserState {
    case notLoggedIn
    case loggedIn(UserSession)
    case guest
}
