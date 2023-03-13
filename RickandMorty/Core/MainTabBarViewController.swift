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
        tabBar.tintColor = .rickAndMortyGreen
        tabBar.backgroundColor = .systemGray
        
        let characterVC = UINavigationController(rootViewController: CharacterViewController())
        let locationVC = UINavigationController(rootViewController: LocationViewController())
        
        characterVC.tabBarItem.image = UIImage(systemName: "person")
        characterVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        locationVC.tabBarItem.image = UIImage(systemName: "heart")
        locationVC.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        
        setViewControllers([characterVC, locationVC], animated: true)
    }
}
