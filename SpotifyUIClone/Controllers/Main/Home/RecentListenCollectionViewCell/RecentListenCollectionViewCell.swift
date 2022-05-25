//
//  RecentListenCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 25/05/2022.
//

import UIKit

class RecentListenCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bind(recentlyListenItemModel: RecentlyListenItemUiModel) {
        layer.cornerRadius = 4
        guard let url = URL(string: recentlyListenItemModel.imageUrl) else {
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        image.image = UIImage(data: data)
        title.text = recentlyListenItemModel.title
    }
}
