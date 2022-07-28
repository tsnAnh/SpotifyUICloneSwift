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

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()

        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.init(red: 16, green: 16, blue: 16)
        self.delegate = self
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
        tabBar.layer.borderColor = UIColor.clear.cgColor
        
        // This do the tricks with tabbar blur background and shadow color
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        
        spotifyTabBar.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        tabItems.forEach {
            let navigationController = UINavigationController(rootViewController: $0.viewController)
            navigationController.isNavigationBarHidden = true
            navigationController.isToolbarHidden = true
            controllers.append(navigationController)
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
        
        tabBarGradientView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}

extension MainViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController != tabBarController.viewControllers?[1] {
            if let secondNavController = tabBarController.viewControllers?[1] as? UINavigationController {
                if secondNavController.viewControllers.first is SearchViewController {
                    secondNavController.popToRootViewController(animated: false)
                }
            }
            return true
        }
        if viewController == selectedViewController {
            if let viewController = viewController as? UINavigationController {
                if viewController.viewControllers.last is SearchAndHistoryViewController {
                    viewController.popToRootViewController(animated: false)
                } else {
                    viewController.pushViewController(SearchAndHistoryViewController(), animated: false)
                }
            }
            return false
        }
        return true
    }
    
}
