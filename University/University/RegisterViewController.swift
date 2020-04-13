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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func SingInButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "signed")
        guard let login = loginTextField.text else {fatalError()}
        guard let password = passwordTextField.text else {fatalError()}
        ValidationDataManager.shared.saveLogin(login: login)
        ValidationDataManager.shared.savePassword(password: password)
    }
    
    func showAlert(viewController: UIViewController, titleMessage: String, message: String) {
        let alert = UIAlertController(title: titleMessage, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
