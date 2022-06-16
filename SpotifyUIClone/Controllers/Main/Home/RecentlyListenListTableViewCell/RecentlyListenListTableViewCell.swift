//
//  RecentlyListenListTableViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 28/05/2022.
//

import UIKit
import Kingfisher

class RecentlyListenListTableViewCell: UITableViewCell {
    @IBOutlet private var labels: [UILabel]!
    @IBOutlet private var images: [UIImageView]!
    @IBOutlet private var itemContainers: [UIView]!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        itemContainers.forEach {
            $0.layer.cornerRadius = 4
            $0.backgroundColor = .white.withAlphaComponent(0.1)
        }
        images.forEach {
            $0.layer.cornerRadius = 4
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        }
    }

    func bindData(recentlyListenItems: [HomeItemUiModel]) {
        let firstSixItems = recentlyListenItems.prefix(6)
        for (index, (image, label)) in zip(images, labels).enumerated() {
            label.text = firstSixItems[index].title
            image.kf.setImage(with: URL(string: firstSixItems[index].imageUrl))
        }
    }
}
