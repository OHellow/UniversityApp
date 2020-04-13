//
//  AlertsFunctions.swift
//  University
//
//  Created by Satsishur on 14.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//

import UIKit

enum Alerts {
    static func showAlert(viewController: UIViewController, titleMessage: String, message: String) {
        let alert = UIAlertController(title: titleMessage, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
