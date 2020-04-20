//
//  WelcomeViewController.swift
//  University
//
//  Created by Satsishur on 13.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    let userName = UserDefaults.standard.object(forKey: "LoginSaved") as? String

    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController?.setNavigationBarHidden(true, animated: true)
        welcomeLabel.text = "Welcome, \(userName ?? "User")!"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func ToClassButtonTapped(_ sender: Any) {
    }
    
    @IBAction func LogOutButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "LoggedIn")
    }
    

}
