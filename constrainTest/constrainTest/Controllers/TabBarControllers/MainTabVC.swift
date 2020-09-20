//
//  MainTabVC.swift
//  constrainTest
//
//  Created by fedir on 20.09.2020.
//  Copyright © 2020 fedir. All rights reserved.
//

import UIKit
import Firebase

class MainTabVC: UITabBarController , UITabBarControllerDelegate {
    
    
    //MARK: - viewDidLoad()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
       tabBarSetUp()
       ifUserLogedIn()
    }
    
    //MARK: - проверка залогинен ли пользователь
    private func ifUserLogedIn() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let vc  = LoginVC()
                let nvc = UINavigationController(rootViewController: vc)
                nvc.modalPresentationStyle = .fullScreen
                self.present(nvc, animated: true, completion: nil)
            }
            return
        }
    }
    
    
    private func tabBarSetUp() {
        
        tabBar.tintColor = .black
        let feed = createNavControler(rootVC: FeedController(collectionViewLayout: UICollectionViewFlowLayout()), titleText: "Feed", titleImage: #imageLiteral(resourceName: "home_selected"))
        let search = createNavControler(rootVC: UIViewController(), titleText: "search", titleImage: #imageLiteral(resourceName: "search_selected"))
        let newpost = createNavControler(rootVC: UIViewController(), titleText: "News", titleImage: #imageLiteral(resourceName: "send2"))
        let likes = createNavControler(rootVC: UIViewController(), titleText: "Likes", titleImage: #imageLiteral(resourceName: "like_selected"))
        let profile = createNavControler(rootVC: UIViewController(), titleText: "Profile", titleImage: #imageLiteral(resourceName: "twitter — копия"))
        viewControllers = [feed, search,newpost,likes,profile]
    }
    
    
    private func createNavControler(rootVC: UIViewController,titleText: String,titleImage: UIImage) -> UIViewController {
        
        let nvc = UINavigationController(rootViewController: rootVC)
        nvc.tabBarItem.title = titleText
        nvc.tabBarItem.image = titleImage
        rootVC.navigationItem.title = titleText
        rootVC.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        return nvc
    }
}
