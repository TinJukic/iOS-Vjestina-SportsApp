//
//  CustomTabBarController.swift
//  SportsApp
//
//  Created by FIVE on 31.05.2022..
//

import Foundation
import UIKit
import PureLayout

class CustomTabBarController: UITabBarController {
    var sportsViewController: SportsViewController!
    var favoritesController: FavoritesController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        buildViews()
    }
    
    func buildViews() {
        sportsViewController = SportsViewController()
        favoritesController = FavoritesController()
        
        self.viewControllers = [
            createTabBarItem(tabBarTitle: "Players", tabBarImage: UIImage(systemName: "person")!, viewController: sportsViewController),
            createTabBarItem(tabBarTitle: "Standings", tabBarImage: UIImage(systemName: "sportscourt")!, viewController: favoritesController)
        ]
    }
    
    func createTabBarItem(tabBarTitle: String, tabBarImage: UIImage, viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationItem.title = "SportsApp"
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        tabBar.tintColor = .systemGreen
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGreen
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController.tabBarItem = UITabBarItem(title: tabBarTitle, image: tabBarImage, selectedImage: tabBarImage)
        
        return navigationController
    }
}
