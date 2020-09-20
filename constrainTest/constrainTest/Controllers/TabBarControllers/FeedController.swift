//
//  FeedController.swift
//  constrainTest
//
//  Created by fedir on 20.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class FeedController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .red
        configureLogOutButton()
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    
   

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .white
        // Configure the cell
    
        return cell
    }
    
    //MARK: - выйти из этого пользователя
    
    private func configureLogOutButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "log out", style: .plain, target: self, action: #selector(handleLogOut))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc private func handleLogOut() {
        //print("press: log out")
        
        let alert = UIAlertController(title: "You try to go out", message: nil, preferredStyle: .actionSheet)
        let not = UIAlertAction(title: "Stay here", style: .default, handler: nil)
        let log = UIAlertAction(title: "Log out", style: .destructive) { (_) in
            do {
                //MARK: - выйти из пользовaтеля Firebace
                try Auth.auth().signOut()
                let vc = LoginVC()
                let nvc = UINavigationController(rootViewController: vc)
                nvc.modalPresentationStyle = .fullScreen
                self.present(nvc, animated: true, completion: nil)
            }catch{
                print("Failed to sign out")
                }
        }
        alert.addAction(not)
        alert.addAction(log)
        present(alert, animated: true, completion: nil)
    }

}
 
