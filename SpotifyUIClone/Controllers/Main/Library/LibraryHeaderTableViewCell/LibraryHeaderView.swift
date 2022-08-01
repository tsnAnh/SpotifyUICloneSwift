//
//  LibraryHeaderTableViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 27/07/2022.
//

import UIKit
import Kingfisher

final class LibraryHeaderView: UIView, NibLoading {
    @IBOutlet private weak var avatarImageView: UIImageView!
    
    static func loadFromXib() -> LibraryHeaderView {
        return LibraryHeaderView.load(nibName: String(describing: Self.self))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImageView.kf.setImage(with: URL(string: "https://cdn.vox-cdn.com/thumbor/4y2s48tJaD0AMtpKIT5B5u3mpsQ=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23352422/003_MoonKnight_KA_R2_JLY_C15_IH_W3.0_ALT_IG_Mech2.jpg"))
        layer.shadowRadius = 4
        layer.shadowOffset = .init(width: 0, height: 4)
    }
    
    override func layoutSubviews() {
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    }
}
