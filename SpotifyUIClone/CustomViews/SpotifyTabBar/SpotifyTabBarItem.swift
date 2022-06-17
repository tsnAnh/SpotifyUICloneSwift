//
//  SpotifyTabBarItem.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 15/05/2022.
//

import UIKit

class SpotifyTabBarItem: UIView {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var label: UILabel!
    private var onClick: ((Int?) -> Void)?

    static func loadFromXib() -> SpotifyTabBarItem {
        SpotifyTabBarItem.load(nibName: "SpotifyTabBarItem")
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        icon.isUserInteractionEnabled = true
        layer.backgroundColor = UIColor.clear.cgColor
        layer.borderColor = UIColor.clear.cgColor
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleClick)))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configure(tabItem: TabItem, onClick: @escaping (Int?) -> Void) {
        icon.image = tabItem.icon
        label.text = tabItem.title
        self.onClick = onClick
    }

    @objc func handleClick(gesture: UITapGestureRecognizer) {
        if gesture.state == .began {
            icon.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        if gesture.state == .ended {
            icon.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        onClick?(tag)
    }
}

extension SpotifyTabBarItem: NibLoading {}
