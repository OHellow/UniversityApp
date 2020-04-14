//
//  UserCollectionViewCell.swift
//  University
//
//  Created by Satsishur on 14.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    static let cellID = "cell"
    
    let imageView = UIImageView()
    let userName: UILabel = {
        let name = UILabel()
        name.text = "name"
        return name
    }()
    let userEmail: UILabel = {
        let surname = UILabel()
        surname.text = "email"
        return surname
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserCollectionViewCell {
    func createCell() {
        addSubview(imageView)
        addSubview(userName)
        addSubview(userEmail)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        userEmail.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        userName.bottomAnchor.constraint(equalTo: userEmail.topAnchor, constant: 5).isActive = true
        userName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userEmail.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        userEmail.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        userEmail.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

