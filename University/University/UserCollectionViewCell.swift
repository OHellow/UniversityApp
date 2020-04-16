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
        name.textColor = UIColor(named: "LabelText")
        return name
    }()
    let userCity: UILabel = {
        let city = UILabel()
        city.text = "email"
        city.textColor = UIColor(named: "LabelText")
        return city
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
        addSubview(userCity)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        userCity.translatesAutoresizingMaskIntoConstraints = false
        userName.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2/3).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 2/3).isActive = true
        userName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        userName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        //userName.widthAnchor.constraint(equalToConstant: Constants.itemWidth*0.9).isActive = true
//        userName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
//        userName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        userName.textAlignment = .center
        userCity.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5).isActive = true
        userCity.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        userCity.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        userEmail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
//        userEmail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        //userEmail.widthAnchor.constraint(equalToConstant: Constants.itemWidth*0.9).isActive = true
        //userEmail.numberOfLines = 0
    }
}

