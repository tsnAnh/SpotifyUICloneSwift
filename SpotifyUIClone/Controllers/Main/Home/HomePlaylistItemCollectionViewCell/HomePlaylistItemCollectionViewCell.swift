//
//  HomePlaylistItemCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 02/06/2022.
//

import UIKit
import Kingfisher

class HomePlaylistItemCollectionViewCell: BaseHomeItemViewModel {

    @IBOutlet private weak var playlistImage: UIImageView!
    @IBOutlet private weak var playlistTitle: UILabel!
    @IBOutlet private weak var playlistSubtitle: UILabel!
    @IBOutlet weak var titleTopContraint: NSLayoutConstraint!
    @IBOutlet weak var titleBottomConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func configure() {
        playlistImage.kf.setImage(with: URL(string: viewModel.imageUrl))
        playlistTitle.text = viewModel.title
        playlistSubtitle.text = viewModel.subtitle
    }
    
    override func layoutSubviews() {
        if viewModel.title != nil {
            playlistTitle.isHidden = false
            let constraintRect = CGSize(width: self.playlistTitle.bounds.width, height: .greatestFiniteMagnitude)
            let boundingBox = viewModel.title?.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: .none, context: nil)
            let _ = self.playlistTitle.heightAnchor.constraint(equalToConstant: ceil(boundingBox?.height ?? 0))
        } else {
            self.playlistTitle.isHidden = true
            self.playlistTitle.constraints.first {
                $0.firstAttribute == .height
            }?.constant = 0
            self.titleBottomConstraint.constant = 0
        }
    }
}
