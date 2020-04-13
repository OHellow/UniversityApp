//
//  RegisterViewController.swift
//  University
//
//  Created by Satsishur on 13.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//

import UIKit

class RegisterLoginViewController: UIViewController {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var singInButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    let fileStorageManager = FileStorageManager()
    
    //let signedIn = UserDefaults.standard.object(forKey: "SignedIn") as? Bool
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        if UserDefaults.standard.object(forKey: "SignedIn") as? Bool == true {
            titleLabel.text = "Authorization"
            singInButton.isHidden = true
            logInButton.isHidden = false
        } else {
            titleLabel.text = "Registration"
            singInButton.isHidden = false
            logInButton.isHidden = true
        }
    }
    
    @IBAction func SingInButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "SignedIn")
        //UserDefaults.standard.set(true, forKey: "LoggedIn")
        guard let login = loginTextField.text else {fatalError()}
        guard let password = passwordTextField.text else {fatalError()}
        UserDefaults.standard.setValue(login, forKey: "LoginSaved")
        UserDefaults.standard.setValue(password, forKey: "PasswordSaved")
        fileStorageManager.saveLoginPasswordToFile(login: login, password: password, fileName: fileStorageManager.nameOfRegisterFile)
    }
    
    @IBAction func LogInButtonTapped(_ sender: Any) {
        guard let login = loginTextField.text else {fatalError()}
        guard let password = passwordTextField.text else {fatalError()}
        if fileStorageManager.checkLoginPasswordFromFile(login: login, password: password, fileName: fileStorageManager.nameOfRegisterFile) == true {
            
            UserDefaults.standard.set(true, forKey: "LoggedIn")
        } else {
            showAlert(viewController: self, titleMessage: "Error!", message: "Wrong password or login")
        }
        
    }
    
    func showAlert(viewController: UIViewController, titleMessage: String, message: String) {
        let alert = UIAlertController(title: titleMessage, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
