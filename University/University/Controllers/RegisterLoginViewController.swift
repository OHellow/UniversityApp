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
    
    let fileStorageManager = FileStorageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "SignedIn") as? Bool == true {
            titleLabel.text = "Authorization"
            singInButton.setTitle("Log in", for: .normal)
        } else {
            titleLabel.text = "Registration"
            singInButton.setTitle("Sign in", for: .normal)
        }
        self.parent?.overrideUserInterfaceStyle = Mode.setMode()
    }

    @IBAction func SingInButtonTapped(_ sender: Any) {
        if UserDefaults.standard.object(forKey: "SignedIn") as? Bool == true {
            makeLogIn()
        } else {
            makeSignIn()
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.present(storyboard.instantiateViewController(identifier: "WelcomeNVC"), animated: true, completion: nil)
    }
}

extension RegisterLoginViewController {
    func makeSignIn() {
        UserDefaults.standard.set(true, forKey: "SignedIn")
        guard let login = loginTextField.text else {fatalError()}
        guard let password = passwordTextField.text else {fatalError()}
        UserDefaults.standard.setValue(login, forKey: "LoginSaved")
        UserDefaults.standard.setValue(password, forKey: "PasswordSaved")
        fileStorageManager.saveLoginPasswordToFile(login: login, password: password, fileName: fileStorageManager.nameOfRegisterFile)
    }
    
    func makeLogIn() {
        guard let login = loginTextField.text else {fatalError()}
        guard let password = passwordTextField.text else {fatalError()}
        if fileStorageManager.checkLoginPasswordFromFile(login: login, password: password, fileName: fileStorageManager.nameOfRegisterFile) == true {
            UserDefaults.standard.set(true, forKey: "LoggedIn")
        } else {
            Alerts.showAlert(viewController: self, titleMessage: "Error!", message: "Wrong password or login")
        }
    }
}

//extension UIColor {
//    static func color(_ red: Int, _ green: Int, _ blue: Int) {
//        UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
//    }
//
//    static func appMainColor() {
//        UIColor.color(1, 2, 3)
//    }
//
//    enum Color {
//        case one
//    }
//
//    convenience init(color:Color) {
//        self.init()
//    }
//}
//
//extension UIViewController {
//
//}
