//
//  CategoryItemViewModel.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 18/06/2022.
//

import UIKit

struct CategoryItemViewModel {
    let categoryName: String
    let imageUrl: String
    
    init(categoryName: String, imageUrl: String) {
        self.categoryName = categoryName
        self.imageUrl = imageUrl
    }
}
