//
//  ChangeModeClass.swift
//  University
//
//  Created by Satsishur on 23.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//

import Foundation
import UIKit

class Mode {
    
    static func setMode() -> UIUserInterfaceStyle {
        guard let mode = UserDefaults.standard.object(forKey: "mode") as? String else {
            return .unspecified
        }
        switch mode {
        case "default":
            return .unspecified
        case "dark":
            return .dark
        case "light":
            return .light
        default:
            return .unspecified
        }
    }
}
    

