//
//  ContentTypeTableViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 08/08/2022.
//

import UIKit

class ContentTypeTableViewCell: UITableViewCell, HasCellIdentifier {
    
    @IBOutlet private weak var contentTypeLabel: UILabel!
    @IBOutlet private weak var contentTypeSelectedImageView: UIImageView!
    
    var contentTypeUi: ContentTypeUi! {
        didSet {
            configureCell()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        contentTypeSelectedImageView.isHidden = !selected
        contentTypeLabel.textColor = selected ? .green : .white
    }
    
    private func configureCell() {
        contentTypeLabel.text = contentTypeUi.contentType.rawValue
    }
    
}
