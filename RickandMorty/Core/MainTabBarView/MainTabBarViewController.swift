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
        tabBar.tintColor = .rickAndMortyPink
        tabBar.barTintColor = .rickAndMortyBlue
        tabBar.backgroundColor = .rickAndMortyBlue
        
        let characterVC = UINavigationController(rootViewController: CharacterViewController())
        let favoritesVC = UINavigationController(rootViewController: LocationViewController())
        
        characterVC.tabBarItem.image = UIImage(systemName: "person")
        characterVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        favoritesVC.tabBarItem.image = UIImage(systemName: "heart")
        favoritesVC.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        
        setViewControllers([characterVC, favoritesVC], animated: true)
    }
}
