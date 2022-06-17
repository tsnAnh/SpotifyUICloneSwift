//
//  HomeItemUiModel.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 28/05/2022.
//

import UIKit

struct HomeItemUiModel {
    var title: String?
    var subtitle: String?
    var imageUrl: String
    var itemType: HomeItemType
}

extension HomeItemUiModel {
    init(imageUrl: String, title: String, itemType: HomeItemType = .Artist) {
        self.imageUrl = imageUrl
        self.title = title
        self.subtitle = nil
        self.itemType = itemType
    }
}
