//
//  MainViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 08/05/2022.
//

import UIKit

class MainViewController: UITabBarController {
    
    let homeViewController = HomeViewController()
    let searchViewController = SearchViewController()
    let libraryViewController = LibraryViewController()
    
    var homeNavigation: UINavigationController!
    var searchNavigation: UINavigationController!
    var libraryNavigation: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        

        homeNavigation = UINavigationController(rootViewController: homeViewController)
        
        searchNavigation = UINavigationController(rootViewController: searchViewController)
        
        libraryNavigation = UINavigationController(rootViewController: libraryViewController)
        
        homeNavigation.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        searchNavigation.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        libraryNavigation.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "folder"), selectedImage: UIImage(systemName: "folder.fill"))
        
        self.viewControllers = [homeNavigation, searchNavigation, libraryNavigation]
        modalPresentationStyle = .fullScreen
    }
}
