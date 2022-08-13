//
//  SearchSection.swift
//  SpotifyUIClone
//
//  Created by Anh Trần Sĩ Nguyên on 19/06/2022.
//

import RxDataSources

enum SearchSection {
    case SearchHeader(items: [SearchItem])
    case CategoriesSection(items: [SearchItem])
}

extension SearchSection: SectionModelType {
    typealias Item = SearchItem
    
    var items: [SearchItem] {
        switch self {
        case .SearchHeader(let items):
            return items
        case .CategoriesSection(let items):
            return items
        }
    }
    
    init(original: SearchSection, items: [SearchItem]) {
        self = original
    }
}
