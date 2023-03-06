//
//  MainTabBarViewController.swift
//  RickandMorty
//
//  Created by Gustavo da Silva Braghin on 06/03/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 151/255, green: 206/255, blue: 76/255, alpha: 1)
        tabBar.backgroundColor = .systemGray
        
        let characterVC = UINavigationController(rootViewController: CharacterViewController())
        let locationVC = UINavigationController(rootViewController: LocationViewController())
        
        characterVC.tabBarItem.image = UIImage(systemName: "person")
        characterVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        locationVC.tabBarItem.image = UIImage(systemName: "location")
        locationVC.tabBarItem.selectedImage = UIImage(systemName: "location.fill")
        
        setViewControllers([characterVC, locationVC], animated: true)
    }
}
