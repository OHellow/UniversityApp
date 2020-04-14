//
//  UsersCollectionViewController.swift
//  University
//
//  Created by Satsishur on 14.04.2020.
//  Copyright © 2020 Consumeda. All rights reserved.
//

import UIKit

class UsersCollectionViewController: UIViewController {

    var collectionView: UICollectionView!
    var userName = ""
    var userEmail = ""
    static var usersData: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.setHidesBackButton(false, animated: true)
        if UsersCollectionViewController.usersData.isEmpty {
        NetworkManager.shared.fetchData(completion: {(data) in
            (data as? Array<User>)?.forEach({print($0)})
            (data as? Array<User>)?.forEach({UsersCollectionViewController.usersData.append(User(id: $0.id, name: $0.name, email: $0.email, address: $0.address))})
//            print(RegisterLoginViewController.mass)
//            var stud = RegisterLoginViewController.mass[1]
//            var a = stud.address.city
//            print(a)
            DispatchQueue.main.async {
            self.collectionView.reloadData()
            }
        })
        }
        createView()
    }
    
    func createView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UserCollectionViewCell.self,
                                forCellWithReuseIdentifier: UserCollectionViewCell.cellID)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension UsersCollectionViewController:  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(UsersCollectionViewController.usersData.count)
        return UsersCollectionViewController.usersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionViewCell.cellID, for: indexPath) as? UserCollectionViewCell else {fatalError("Error")}
        
        let users = UsersCollectionViewController.usersData[indexPath.row]
        cell.userName.text = users.name
        cell.userEmail.text = users.email
        cell.imageView.image = UIImage(named: "ninja")
        return cell
        
    }
}

extension UsersCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 180)
    }
    
    //        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //            let profileVC = storyboard?.instantiateViewController(identifier: "profileVC") as? ProfileViewController
    //            let student = ClassCollectionViewController.characterData[indexPath.row]
    //            profileVC?.profileType = profileTypeNumber
    //            profileVC?.studentName = (profileVC?.studentName ?? "Name: ") + student.name
    //            profileVC?.studentSurname = (profileVC?.studentSurname ?? "Mass: ") + student.mass
    //            profileVC?.studentAge = (profileVC?.studentAge ?? "Birth date: ") + student.birth_year
    //            let gend = student.gender
    //            switch gend {
    //            case "male":
    //                profileVC?.studentGender = (profileVC?.studentGender ?? "Gender: ") + gend
    //                profileVC?.imageName = "student-3"
    //            case "female":
    //                profileVC?.studentGender = (profileVC?.studentGender ?? "Gender: ") + gend
    //                profileVC?.imageName = "student-2"
    //            default:
    //                profileVC?.studentGender = (profileVC?.studentGender ?? "Gender: ") + gend
    //                profileVC?.imageName = "robot"
    //            }
    //            self.navigationController?.pushViewController(profileVC!, animated: true)
    //        }
}


