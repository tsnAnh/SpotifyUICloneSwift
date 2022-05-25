//
//  MainViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 08/05/2022.
//

import UIKit
import SnapKit

class MainViewController: UITabBarController {
    private var spotifyTabBar: SpotifyTabBar!
    private let tabBarHeight: CGFloat = 64
    
    let homeViewController = HomeViewController()
    let searchViewController = SearchViewController()
    let libraryViewController = LibraryViewController()
    
    var homeNavigation: UINavigationController!
    var searchNavigation: UINavigationController!
    var libraryNavigation: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    fileprivate func setupTabBar() {
        let tabItems: [TabItem] = [.home, .search, .library]
        var controllers = [UIViewController]()
        spotifyTabBar = SpotifyTabBar(menuItems: tabItems, frame: .zero)
        spotifyTabBar.clipsToBounds = true
        spotifyTabBar.itemTapped = changeTab(index:)
        tabBar.addSubview(spotifyTabBar)
        
        tabItems.forEach {
            controllers.append($0.viewController)
        }
        
        view.layoutIfNeeded()
        self.viewControllers = controllers
        selectedIndex = 0
    }
    
    func changeTab(index: Int) {
        self.selectedIndex = index
    }
}
