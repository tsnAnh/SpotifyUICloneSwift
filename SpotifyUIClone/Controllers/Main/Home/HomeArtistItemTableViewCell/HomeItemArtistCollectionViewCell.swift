//
//  HomeItemTableViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 28/05/2022.
//

import UIKit
import Kingfisher

class HomeItemArtistCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        DispatchQueue.main.async {
            self.itemImage.layer.cornerRadius = min(self.itemImage.frame.height, self.itemImage.frame.width) / 2
            self.itemImage.clipsToBounds = true
            self.itemImage.layoutIfNeeded()
            self.contentView.layoutSubviews()
            self.title.sizeToFit()
        }
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func bindData(item: HomeItemUiModel, isSizing: Bool = false) {
        itemImage.kf.setImage(with: URL(string: item.imageUrl))
        title.text = item.title
    }
}
