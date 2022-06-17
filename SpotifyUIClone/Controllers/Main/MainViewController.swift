//
//  MainViewController.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 08/05/2022.
//

import UIKit

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    fileprivate func setupTabBar() {
        let tabItems: [TabItem] = [.home, .search, .library]
        var controllers = [UIViewController]()
        spotifyTabBar = SpotifyTabBar(menuItems: tabItems, frame: .zero)
        spotifyTabBar.clipsToBounds = true
        spotifyTabBar.itemTapped = changeTab(index:)
        spotifyTabBar.layer.zPosition = 1
        tabBar.addSubview(spotifyTabBar)
        tabBar.backgroundImage = UIImage()
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.shadowImage = UIImage()
        
        NSLayoutConstraint.activate([
            spotifyTabBar.topAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: 0),
            spotifyTabBar.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            spotifyTabBar.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
        ])
        
        tabItems.forEach {
            controllers.append($0.viewController)
        }

        self.viewControllers = controllers
        selectedIndex = 0
    }

    func changeTab(index: Int) {
        self.selectedIndex = index
    }
    
    override func viewDidLayoutSubviews() {
        let tabBarGradientView = UIView()
        tabBarGradientView.translatesAutoresizingMaskIntoConstraints = false
        tabBarGradientView.clipsToBounds = false
        tabBarGradientView.frame = tabBar.bounds
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.frame = tabBar.bounds
        gradientLayer.locations = [0, 1]
        tabBarGradientView.layer.insertSublayer(gradientLayer, at: 0)
        tabBarGradientView.layer.zPosition = 0
        
        tabBar.addSubview(tabBarGradientView)
        tabBar.sendSubviewToBack(tabBarGradientView)
        
        NSLayoutConstraint.activate([
            tabBarGradientView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0),
            tabBarGradientView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: 0),
            tabBarGradientView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tabBarGradientView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
        ])
    }
}
