//
//  ValidationDataManager.swift
//  University
//
//  Created by Satsishur on 13.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//

import Foundation
import UIKit

class ValidationDataManager {
    static let shared = ValidationDataManager()
//    var loginSaved: String!
//    var passwordSaved: String!

    func saveLogin(login: String) {
        UserDefaults.standard.set(login, forKey: UserDefaultsKeys.LoginSaved)
        //loginSaved = login
    }
    func savePassword(password: String) {
        UserDefaults.standard.set(password, forKey: UserDefaultsKeys.PasswordSaved)
        //passwordSaved = password
    }

    private init() {}
}

enum UserDefaultsKeys {
    static let SignedIn = "SignedIn"
    static let LoggedIn = "LoggedIn"
    static let LoginSaved = "LoginSaved"
    static let PasswordSaved = "PasswordSaved"
}
