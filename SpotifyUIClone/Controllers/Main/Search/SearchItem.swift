//
//  SearchItem.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 19/06/2022.
//

import RxDataSources

enum SearchItem {
    case Categories(header: String, categories: [CategoryItemViewModel])
}
