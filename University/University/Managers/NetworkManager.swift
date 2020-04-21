//
//  NetworkManager.swift
//  University
//
//  Created by Satsishur on 14.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(page: String, completion: @escaping (Any?) -> Void) {
        
        let session = URLSession.shared
        guard let url = URL(string: page) else {return}

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let  data = data else {return}
            guard error == nil else {return}
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode)
                else {return}
            do {
                let json = try JSONDecoder().decode(Array<User>.self, from: data)
                //json.forEach({print($0)})
                completion(json)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

struct User: Codable {
    var id: Int
    var name: String
    var email: String
    var address: Address
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case address
    }
}

struct Address: Codable {
    var street: String
    var city: String
    
    enum CodingKeys: String, CodingKey {
        case street
        case city
    }
}
