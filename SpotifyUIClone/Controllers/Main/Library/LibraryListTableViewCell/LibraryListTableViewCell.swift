//
//  LibraryListTableViewCell.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 02/08/2022.
//

import UIKit

class LibraryListTableViewCell: UITableViewCell, HasCellIdentifier {
    
    static func cellIdentifier() -> String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
