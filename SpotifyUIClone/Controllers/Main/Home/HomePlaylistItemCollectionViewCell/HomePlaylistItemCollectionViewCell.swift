//
//  HomePlaylistItemCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 02/06/2022.
//

import UIKit
import Kingfisher

class HomePlaylistItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var playlistImage: UIImageView!
    @IBOutlet private weak var playlistTitle: UILabel!
    @IBOutlet private weak var playlistSubtitle: UILabel!
    @IBOutlet weak var titleTopContraint: NSLayoutConstraint!
    @IBOutlet weak var titleBottomConstraint: NSLayoutConstraint!
    
    private var item: HomeItemUiModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func bindData(item: HomeItemUiModel) {
        self.item = item
    }
    
    override func layoutSubviews() {
        playlistImage.kf.setImage(with: URL(string: item.imageUrl))
        if item.title != nil {
            playlistTitle.text = item.title
            playlistTitle.isHidden = false
            let constraintRect = CGSize(width: self.playlistTitle.bounds.width, height: .greatestFiniteMagnitude)
            let boundingBox = item.title?.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: .none, context: nil)
            let _ = self.playlistTitle.heightAnchor.constraint(equalToConstant: ceil(boundingBox?.height ?? 0))
        } else {
            self.playlistTitle.isHidden = true
            self.playlistTitle.constraints.first {
                $0.firstAttribute == .height
            }?.constant = 0
            self.titleTopContraint.constant = 4
            self.titleBottomConstraint.constant = 0
        }
        playlistTitle.layoutIfNeeded()
        playlistSubtitle.text = item.subtitle
    }
}
