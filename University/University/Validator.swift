//
//  Validator.swift
//  University
//
//  Created by Satsishur on 13.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//
//
//import Foundation
//
//class Validator {
//
//    func isPasswordValid(_ value: String) -> Bool {
//
//        do {
//            if try NSRegularExpression(pattern: "[0-9a-zA-Z\\_]{1,}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
//                return false
//            }
//        } catch {
//            return false
//        }
//        return true
//    }
//
//    func isLoginValid(_ value: String) -> Bool {
//
//        do {
//            if try NSRegularExpression(pattern: "^[0-9a-zA-Z\\_]{1,}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
//                return false
//            }
//        } catch {
//            return false
//        }
//        return true
//    }
//}
