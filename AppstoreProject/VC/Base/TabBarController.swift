//
//  TabBarController.swift
//  PolaroidProject
//
//  Created by 박성민 on 7/23/24.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray

        let arcadeVC = ArcadeViewController()
        let searchVC = SearchViewController()

        let arcadeNav = UINavigationController(rootViewController: arcadeVC)
        arcadeNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "star"), tag: 0)
        
        let searchNav = UINavigationController(rootViewController: searchVC)
        searchNav.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        setViewControllers([searchNav,arcadeNav], animated: false)
    }
}
