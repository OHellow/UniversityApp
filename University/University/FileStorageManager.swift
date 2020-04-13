//
//  FileStorageManager.swift
//  University
//
//  Created by Satsishur on 13.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//

import Foundation

class FileStorageManager {
    let nameOfRegisterFile = "users.txt"
    
    func saveLoginPasswordToFile(login: String, password: String, fileName: String) {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let url = urls.first?.appendingPathComponent(fileName) else { return }
        let userLoginPassword = makeMokup(login: login, password: password)
        do {
            let dataFromDictionary = try JSONEncoder().encode(userLoginPassword)
            try dataFromDictionary.write(to: url)
        } catch {
            print("error writing login and password to file \(error)")
        }
    }
    
    func checkLoginPasswordFromFile(login: String, password: String, fileName: String) -> Bool {
        var loginAndPasswordAreCorrect = false
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let url = urls.first?.appendingPathComponent(fileName) else { fatalError("No loginPassword file") }
        do {
            let loginPasswordFromFile = try Data(contentsOf: url)
            let loginPasswordFromDictionary = try JSONDecoder().decode(LoginPassword.self, from: loginPasswordFromFile)
            if login != loginPasswordFromDictionary.userPassword.first?.key || password != loginPasswordFromDictionary.userPassword.first?.value {
                loginAndPasswordAreCorrect = false
            } else {
                loginAndPasswordAreCorrect = true
            }
        } catch {
            print("error reading login and password from file \(error)")
        }
        return loginAndPasswordAreCorrect
    }
    
    func makeMokup(login: String, password: String) -> LoginPassword {
        LoginPassword(userPassword: [login:password])
    }
}

struct LoginPassword: Codable {
    let userPassword: Dictionary<String, String>
}


