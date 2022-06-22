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

    private let homeViewController = HomeViewController()
    private let searchViewController = SearchViewController()
    private let libraryViewController = LibraryViewController()

    private var homeNavigation: UINavigationController!
    private var searchNavigation: UINavigationController!
    private var libraryNavigation: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()

        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.init(red: 16, green: 16, blue: 16)
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
        tabBar.addSubview(spotifyTabBar)
        tabBar.backgroundImage = UIImage()
        tabBar.layer.borderColor = UIColor.clear.cgColor
        tabBar.shadowImage = UIImage()
        
        spotifyTabBar.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        tabItems.forEach {
            controllers.append($0.viewController)
        }

        self.viewControllers = controllers
        selectedIndex = 0
    }

    fileprivate func changeTab(index: Int) {
        self.selectedIndex = index
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
        
        tabBar.addSubview(tabBarGradientView)
        tabBar.sendSubviewToBack(tabBarGradientView)
        
        NSLayoutConstraint.activate([
            tabBarGradientView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0),
            tabBarGradientView.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: 0),
            tabBarGradientView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tabBarGradientView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
        ])
        tabBarGradientView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
