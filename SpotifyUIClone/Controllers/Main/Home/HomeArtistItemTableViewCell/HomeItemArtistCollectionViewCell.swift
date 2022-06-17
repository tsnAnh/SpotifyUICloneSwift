//
//  HomeItemTableViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 28/05/2022.
//

import UIKit
import Kingfisher

class HomeItemArtistCollectionViewCell: BaseHomeItemViewModel {

    @IBOutlet private weak var itemImage: UIImageView!
    @IBOutlet private weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemImage.clipsToBounds = true
    }
    
    override func configure() {
        itemImage.kf.setImage(with: URL(string: viewModel.imageUrl))
        title.text = viewModel.title
        self.itemImage.layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.itemImage.layer.cornerRadius = min(self.itemImage.frame.height, self.itemImage.frame.width) / 2
    }
}
