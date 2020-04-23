//
//  SettingsViewController.swift
//  University
//
//  Created by Satsishur on 20.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var userModeLabel: UILabel!
    @IBOutlet weak var defaultModeLabel: UILabel!
    @IBOutlet weak var defaultModeSwitch: UISwitch!
    @IBOutlet weak var userModeSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let mode = UserDefaults.standard.object(forKey: "mode") as? String {
            if mode == "default" {
                userModeSwitch.isHidden = true
                userModeLabel.isHidden = true
                defaultModeSwitch.isOn = true
            } else {
                defaultModeSwitch.isOn = false
                userModeSwitch.isHidden = false
                userModeLabel.isHidden = false
                if let userMode = UserDefaults.standard.object(forKey: "mode") as? String {
                    if userMode == "dark" {
                        userModeSwitch.isOn = true
                    } else {
                         userModeSwitch.isOn = false
                    }
                }
            }
        }
    }
    
    @IBAction func defaultModeSwitched(_ sender: UISwitch) {
        if sender.isOn {
            userModeSwitch.isHidden = true
            userModeLabel.isHidden = true
            UserDefaults.standard.set("default", forKey: "mode")
            overrideUserInterfaceStyle = .unspecified
            self.parent?.overrideUserInterfaceStyle = .unspecified
        } else {
            userModeSwitch.isHidden = false
            userModeLabel.isHidden = false
            UserDefaults.standard.set(userModeSwitch.isOn ? "dark" : "light", forKey: "mode")
            if let userMode = UserDefaults.standard.object(forKey: "mode") as? String {
                if userMode == "dark" {
                    overrideUserInterfaceStyle = .dark
                    self.parent?.overrideUserInterfaceStyle = .dark
                } else {
                    overrideUserInterfaceStyle = .light
                    self.parent?.overrideUserInterfaceStyle = .light
                }
            }
        }
    }
    
    @IBAction func userModeSwitched(_ sender: UISwitch) {
        self.parent?.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
        if sender.isOn {
            overrideUserInterfaceStyle = .dark
            //self.parent?.overrideUserInterfaceStyle = .dark
            UserDefaults.standard.set("dark", forKey: "mode")
        } else {
            overrideUserInterfaceStyle = .light
            //self.parent?.overrideUserInterfaceStyle = .light
            UserDefaults.standard.set("light", forKey: "mode")
        }
    }
}





    

