//
//  LibraryTypeCollectionViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 02/08/2022.
//

import UIKit

class LibraryTypeCollectionViewCell: UICollectionViewCell, HasCellIdentifier {
    
    @IBOutlet weak var chipLabel: Chip!
    var text: String = "" {
        didSet {
            chipLabel.text = text
            layoutIfNeeded()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.chipLabel.preferredMaxLayoutWidth = self.chipLabel.frame.size.width
        super.layoutSubviews()
    }

}
