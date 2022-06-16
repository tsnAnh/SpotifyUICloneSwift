//
//  SpotifyTabBar.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 15/05/2022.
//

import UIKit

class SpotifyTabBar: UIStackView {
    var itemTapped: ((_ tab: Int) -> Void)?
    var selectedItem: Int = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)

        setup(menuItems: menuItems, frame: frame)
    }

    private func setup(menuItems: [TabItem], frame: CGRect) {
        layer.backgroundColor = UIColor.white.cgColor
        axis = .horizontal
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        alignment = .fill
        distribution = .fillEqually

        for index in 0 ..< menuItems.count {
            let itemView = createTabItem(tabItem: menuItems[index])
            itemView.tag = index

            addArrangedSubview(itemView)
        }

        setNeedsLayout()
        layoutIfNeeded()
        switchTab(to: 0)
    }

    private func createTabItem(tabItem: TabItem) -> UIView {
        let spotifyTabBarItem = SpotifyTabBarItem.loadFromXib()
        spotifyTabBarItem.configure(tabItem: tabItem) { index in
            guard let index = index else {
                print("I have no idea")
                return
            }

            self.switchTab(to: index)
        }
        return spotifyTabBarItem
    }

    func switchTab(to: Int) {
        self.itemTapped?(to)
        self.selectedItem = to
    }
}
