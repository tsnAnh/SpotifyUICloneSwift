//
//  HomeHeaderTableViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 26/05/2022.
//

import UIKit

class HomeHeaderTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var notificationIcon: UIImageView!
    @IBOutlet private weak var historyIcon: UIImageView!
    @IBOutlet private weak var settingsIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
