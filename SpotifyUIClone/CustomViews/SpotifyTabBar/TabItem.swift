//
//  TabItem.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 15/05/2022.
//

import UIKit

enum TabItem: String, CaseIterable {
    case home = "home"
    case search = "search"
    case library = "library"

    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .search:
            return SearchViewController()
        case .library:
            return LibraryViewController()
        }
    }

    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house")
        case .search:
            return UIImage(systemName: "magnifyingglass")
        case .library:
            return UIImage(systemName: "folder")
        }
    }

    var selectedIcon: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")
        case .search:
            return UIImage(systemName: "magnifyingglass")
        case .library:
            return UIImage(systemName: "folder.fill")
        }
    }

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .library:
            return "Library"
        }
    }
}
