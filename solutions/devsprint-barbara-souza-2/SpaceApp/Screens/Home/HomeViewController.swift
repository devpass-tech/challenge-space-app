//
//  HomeViewController.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/03/22.
//

import UIKit

class HomeViewController: UITabBarController {
    
    override func viewDidLoad() {
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        self.tabBar.backgroundColor = .backgroundNextLaunchColor
        
        let homeVC = UINavigationController(rootViewController: NextLaunchesViewController())
        homeVC.tabBarItem.image = UIImage(systemName: "house.fill")
        homeVC.title = "Home"
        
        let launchVC = UINavigationController(rootViewController: LaunchDetailsViewController())
        launchVC.tabBarItem.image = UIImage(systemName: "location.north.fill")
        launchVC.title = "Launches"
        
        let controllers = [homeVC, launchVC]
        
        self.setViewControllers(controllers, animated: false)
    }
}
